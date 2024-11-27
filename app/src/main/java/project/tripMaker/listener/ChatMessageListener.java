package project.tripMaker.listener;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.stereotype.Component;
import project.tripMaker.controller.ChatWebSocketHandler;
import project.tripMaker.vo.ChatMessage;

@Component
@RequiredArgsConstructor
public class ChatMessageListener implements MessageListener {

  private final ObjectMapper objectMapper;
  private final ChatWebSocketHandler webSocketHandler;

  @Override
  public void onMessage(Message message, byte[] pattern) {
    try {
      String messageStr = new String(message.getBody());
      ChatMessage chatMessage = objectMapper.readValue(messageStr, ChatMessage.class);
      webSocketHandler.broadcastMessage(chatMessage);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
