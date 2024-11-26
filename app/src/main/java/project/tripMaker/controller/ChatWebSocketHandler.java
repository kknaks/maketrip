package project.tripMaker.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import project.tripMaker.vo.ChatMessage;
import project.tripMaker.service.ChatService;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

@Component
@RequiredArgsConstructor
public class ChatWebSocketHandler extends TextWebSocketHandler {

  private final ChatService chatService;
  private final ObjectMapper objectMapper;

  // userId와 WebSocket 세션을 매핑
  private final Map<String, WebSocketSession> sessions = new ConcurrentHashMap<>();
  private final Map<String, Set<String>> roomMembers = new ConcurrentHashMap<>();

  @Override
  public void afterConnectionEstablished(WebSocketSession session) {
    String userId = extractUserId(session);
    String roomId = extractRoomId(session);

    System.out.println("New WebSocket connection - userId: " + userId + ", roomId: " + roomId);
    System.out.println("Session details: " + session);

    sessions.put(userId, session);
    System.out.println("Current sessions after adding: " + sessions.keySet());

    chatService.markMessagesAsRead(roomId, userId);
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

      // 새로운 TextMessage 객체 생성
      String messageJson = objectMapper.writeValueAsString(chatMessage);
      TextMessage textMessage = new TextMessage(messageJson);

      // 채팅방의 모든 사용자(발신자 포함)에게 메시지 전송
      sessions.forEach((key, userSession) -> {
        if (userSession.isOpen()) {  // 발신자 체크 조건 제거
          try {
            userSession.sendMessage(textMessage);
            System.out.println("Message sent to user: " + key);
          } catch (IOException e) {
            System.out.println("Error sending message to user: " + key);
            e.printStackTrace();
          }
        }
      });
    } catch (Exception e) {
      System.out.println("Error in handleTextMessage: " + e.getMessage());
      e.printStackTrace();
    }
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
  public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
    String userId = extractUserId(session);
    sessions.remove(userId);
    System.out.println("WebSocket Closed - userId: " + userId);
    System.out.println("Remaining sessions: " + sessions.keySet());
  }

  @Override
  public void handleTransportError(WebSocketSession session, Throwable exception) {
    System.out.println("WebSocket Transport Error: " + exception.getMessage());
    exception.printStackTrace();
  }
}
