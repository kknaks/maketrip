// package project.tripMaker.service;
//
// import java.util.List;
// import org.springframework.scheduling.annotation.Scheduled;
// import org.springframework.stereotype.Service;
// import project.tripMaker.vo.ChatMessage;
//
// @Service
// public class ChatArchiveService {
//
//  private final ChatService2 chatService;
//  private final ChatMessageRepository repository;
//
//  public ChatArchiveService(ChatService2 chatService
//      ,ChatMessageRepository repository
//  ) {
//    this.chatService = chatService;
//    this.repository = repository;
//  }
//
//  @Scheduled(fixedRate = 3600000) // 1시간마다 실행
//  public void archiveMessages() {
//    String roomId = "chat:room1"; // 대상 채팅방 ID
//    List<String> messages = chatService.getRecentMessagesFromRedis(roomId);
//
//    for (String message : messages) {
//      ChatMessage chatMessage = new ChatMessage(roomId, "system", message);
//      repository.save(chatMessage);
//    }
//
//    chatService.clearMessagesFromRedis(roomId); // Redis 데이터 정리
//  }
// }
