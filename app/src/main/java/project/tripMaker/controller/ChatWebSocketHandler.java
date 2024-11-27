package project.tripMaker.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import project.tripMaker.vo.ChatMessage;
import project.tripMaker.service.ChatService;
import lombok.Data;
import lombok.AllArgsConstructor;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Component
@RequiredArgsConstructor
public class ChatWebSocketHandler extends TextWebSocketHandler {

  private final ChatService chatService;
  private final ObjectMapper objectMapper;
  private final StringRedisTemplate redisTemplate;

  private static final String CHAT_TOPIC = "chat:messages";
  private final Map<String, WebSocketSession> localSessions = new ConcurrentHashMap<>();

  @Override
  public void afterConnectionEstablished(WebSocketSession session) {
    try {
      String userId = extractUserId(session);
      String roomId = extractRoomId(session);

      System.out.println("New WebSocket connection - userId: " + userId + ", roomId: " + roomId);
      System.out.println("Session details: " + session);

      localSessions.put(userId, session);

//      // Redis에 세션 정보 저장
//      SessionInfo sessionInfo = new SessionInfo(userId, roomId);
//      redisTemplate.opsForHash().put("websocket:sessions", userId,
//          objectMapper.writeValueAsString(sessionInfo));

      chatService.markMessagesAsRead(roomId, userId);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  @Override
  protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
    String userId = extractUserId(session);
    String roomId = extractRoomId(session);

    System.out.println("Message received - userId: " + userId + ", roomId: " + roomId);
    System.out.println("Message content: " + message.getPayload());

    try {
      ChatMessage chatMessage = objectMapper.readValue(message.getPayload(), ChatMessage.class);
      chatService.saveMessage(chatMessage);

      String messageJson = objectMapper.writeValueAsString(chatMessage);
      redisTemplate.convertAndSend(CHAT_TOPIC, messageJson);
    } catch (Exception e) {
      System.out.println("Error in handleTextMessage: " + e.getMessage());
      e.printStackTrace();
    }
  }

  public void broadcastMessage(ChatMessage chatMessage) throws IOException {
    String messageJson = objectMapper.writeValueAsString(chatMessage);
    TextMessage textMessage = new TextMessage(messageJson);

    for (WebSocketSession session : localSessions.values()) {
      if (session.isOpen()) {
        try {
          session.sendMessage(textMessage);
        } catch (IOException e) {
          e.printStackTrace();
        }
      }
    }
  }

  @Override
  public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
    String userId = extractUserId(session);
    localSessions.remove(userId);
    redisTemplate.opsForHash().delete("websocket:sessions", userId);

    System.out.println("WebSocket Closed - userId: " + userId);
    System.out.println("Remaining sessions: " + localSessions.keySet());
  }

  private String extractUserId(WebSocketSession session) {
    String query = session.getUri().getQuery();
    return Arrays.stream(query.split("&"))
        .filter(param -> param.startsWith("userId="))
        .map(param -> param.split("=")[1])
        .findFirst()
        .orElse(null);
  }

  private String extractRoomId(WebSocketSession session) {
    String query = session.getUri().getQuery();
    return Arrays.stream(query.split("&"))
        .filter(param -> param.startsWith("roomId="))
        .map(param -> param.split("=")[1])
        .findFirst()
        .orElse(null);
  }

  @Override
  public void handleTransportError(WebSocketSession session, Throwable exception) {
    System.out.println("WebSocket Transport Error: " + exception.getMessage());
    exception.printStackTrace();
  }

  @Data
  @AllArgsConstructor
  private static class SessionInfo {
    private String userId;
    private String roomId;
  }
}
