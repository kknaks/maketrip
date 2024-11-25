package project.tripMaker.vo;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class ChatMessage {
  private String messageId;
  private String roomId;
  private String senderId;
  private String receiverId;
  private String content;
  private LocalDateTime timestamp;
  private boolean read;
}
