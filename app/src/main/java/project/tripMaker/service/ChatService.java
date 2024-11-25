package project.tripMaker.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import project.tripMaker.vo.ChatMessage;
import project.tripMaker.vo.ChatRoom;
import project.tripMaker.vo.User;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.*;

@Service
@RequiredArgsConstructor
public class ChatService {
  private final RedisTemplate<String, String> redisTemplate;
  private final ObjectMapper objectMapper;
  private final UserService userService;
  private static final int PAGE_SIZE = 50;

  // Redis 키 상수
  private static final String CHAT_ROOM_KEY = "chat:room:";
  private static final String CHAT_USER_ROOMS_KEY = "chat:user:rooms:";
  private static final String CHAT_MESSAGES_KEY = "chat:messages:";
  private static final String CHAT_UNREAD_KEY = "chat:unread:";

  // 채팅방 관련 메서드들
  public ChatRoom createChatRoom(String user1Id, String user2Id) {
    String roomId = generateRoomId(user1Id, user2Id);

    try {
      // 이미 존재하는 채팅방인지 확인
      String existingRoom = redisTemplate.opsForValue().get(CHAT_ROOM_KEY + roomId);
      if (existingRoom != null) {
        return objectMapper.readValue(existingRoom, ChatRoom.class);
      }

      // User 정보 조회 - String을 Long으로 변환
      User user1 = userService.get(Long.parseLong(user1Id));
      User user2 = userService.get(Long.parseLong(user2Id));

      // 새 채팅방 생성
      ChatRoom chatRoom = new ChatRoom();
      chatRoom.setRoomId(roomId);
      chatRoom.setUser1Id(user1Id);
      chatRoom.setUser2Id(user2Id);
      chatRoom.setUser1Nickname(user1.getUserNickname());
      chatRoom.setUser2Nickname(user2.getUserNickname());
      chatRoom.setLastMessageTime(LocalDateTime.now());

      // Redis에 저장
      saveRoom(chatRoom);

      // 사용자의 채팅방 목록에 추가
      redisTemplate.opsForSet().add(CHAT_USER_ROOMS_KEY + user1Id, roomId);
      redisTemplate.opsForSet().add(CHAT_USER_ROOMS_KEY + user2Id, roomId);

      return chatRoom;
    } catch (Exception e) {
      throw new RuntimeException("채팅방 생성 실패", e);
    }
  }

  private void saveRoom(ChatRoom room) throws Exception {
    String roomJson = objectMapper.writeValueAsString(room);
    redisTemplate.opsForValue().set(CHAT_ROOM_KEY + room.getRoomId(), roomJson);
  }

  private String generateRoomId(String user1Id, String user2Id) {
    String[] users = {user1Id, user2Id};
    Arrays.sort(users);
    return users[0] + "_" + users[1];
  }

  // 메시지 관련 메서드들
  public void saveMessage(ChatMessage message) {
    try {
      message.setMessageId(UUID.randomUUID().toString());
      message.setTimestamp(LocalDateTime.now());
      message.setRead(false);

      String messageJson = objectMapper.writeValueAsString(message);
      String messageKey = CHAT_MESSAGES_KEY + message.getRoomId();

      redisTemplate.opsForList().rightPush(messageKey, messageJson);
      redisTemplate.expire(messageKey, Duration.ofHours(24));

      updateRoomLastMessage(message);
      redisTemplate.opsForValue().increment(CHAT_UNREAD_KEY + message.getRoomId() + ":" + message.getReceiverId());
      System.out.println("=================="+CHAT_UNREAD_KEY + message.getRoomId() + ":" + message.getReceiverId());
    } catch (Exception e) {
      throw new RuntimeException("메시지 저장 실패", e);
    }
  }

  private void updateRoomLastMessage(ChatMessage message) {
    try {
      String roomJson = redisTemplate.opsForValue().get(CHAT_ROOM_KEY + message.getRoomId());
      if (roomJson != null) {
        ChatRoom room = objectMapper.readValue(roomJson, ChatRoom.class);
        room.setLastMessage(message.getContent());
        room.setLastMessageTime(message.getTimestamp());
        saveRoom(room);
      }
    } catch (Exception e) {
      throw new RuntimeException("채팅방 최근 메시지 업데이트 실패", e);
    }
  }

  public List<ChatMessage> getChatMessages(String roomId, int page) {
    try {
      long start = (long) page * PAGE_SIZE;
      long end = start + PAGE_SIZE - 1;

      List<String> messageJsons = redisTemplate.opsForList()
          .range(CHAT_MESSAGES_KEY + roomId, start, end);

      List<ChatMessage> messages = new ArrayList<>();
      if (messageJsons != null) {
        for (String json : messageJsons) {
          messages.add(objectMapper.readValue(json, ChatMessage.class));
        }
      }

      return messages;
    } catch (Exception e) {
      throw new RuntimeException("메시지 조회 실패", e);
    }
  }

  // 읽음 처리 관련 메서드들
  public int getUnreadMessageCount(String roomId, String userId) {
    String count = redisTemplate.opsForValue().get(CHAT_UNREAD_KEY + roomId + ":" + userId);
    return count != null ? Integer.parseInt(count) : 0;
  }

  public void markMessagesAsRead(String roomId, String userId) {
    redisTemplate.delete(CHAT_UNREAD_KEY + roomId + ":" + userId);
  }

  // 채팅방 관리 메서드들
  public boolean existsChatRoom(String roomId) {
    return Boolean.TRUE.equals(redisTemplate.hasKey(CHAT_ROOM_KEY + roomId));
  }

  public void deleteChatRoom(String roomId) {
    try {
      String roomJson = redisTemplate.opsForValue().get(CHAT_ROOM_KEY + roomId);
      if (roomJson != null) {
        ChatRoom room = objectMapper.readValue(roomJson, ChatRoom.class);
        redisTemplate.opsForSet().remove(CHAT_USER_ROOMS_KEY + room.getUser1Id(), roomId);
        redisTemplate.opsForSet().remove(CHAT_USER_ROOMS_KEY + room.getUser2Id(), roomId);

        redisTemplate.delete(CHAT_ROOM_KEY + roomId);
        redisTemplate.delete(CHAT_MESSAGES_KEY + roomId);
        redisTemplate.delete(CHAT_UNREAD_KEY + roomId + ":" + room.getUser1Id());
        redisTemplate.delete(CHAT_UNREAD_KEY + roomId + ":" + room.getUser2Id());
      }
    } catch (Exception e) {
      throw new RuntimeException("채팅방 삭제 실패", e);
    }
  }

  public void deleteAllUserRooms(String userId) {
    Set<String> roomIds = redisTemplate.opsForSet().members(CHAT_USER_ROOMS_KEY + userId);
    if (roomIds != null) {
      for (String roomId : roomIds) {
        deleteChatRoom(roomId);
      }
      redisTemplate.delete(CHAT_USER_ROOMS_KEY + userId);
    }
  }

  public List<ChatRoom> getUserChatRooms(String userId) {
    try {
      Set<String> roomIds = redisTemplate.opsForSet().members(CHAT_USER_ROOMS_KEY + userId);
      List<ChatRoom> rooms = new ArrayList<>();

      if (roomIds != null) {
        for (String roomId : roomIds) {
          String roomData = redisTemplate.opsForValue().get(CHAT_ROOM_KEY + roomId);
          if (roomData != null) {
            ChatRoom room = objectMapper.readValue(roomData, ChatRoom.class);
            // 안읽은 메시지 수 계산
            room.setUnreadCount(getUnreadMessageCount(roomId, userId));
            rooms.add(room);
          }
        }
      }

      // 최근 메시지 시간 순으로 정렬
      rooms.sort((r1, r2) -> r2.getLastMessageTime().compareTo(r1.getLastMessageTime()));
      return rooms;
    } catch (Exception e) {
      throw new RuntimeException("채팅방 목록 조회 실패", e);
    }
  }


}
