package project.tripMaker.vo;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class ChatRoom {
  private String roomId;
  private String user1Id;
  private String user2Id;
  private String user1Nickname;  // 추가
  private String user2Nickname;  // 추가
  private String lastMessage;
  private LocalDateTime lastMessageTime;
  private int unreadCount;
}
