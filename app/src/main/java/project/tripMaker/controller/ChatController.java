package project.tripMaker.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import project.tripMaker.vo.ChatMessage;
import project.tripMaker.vo.ChatRoom;
import project.tripMaker.service.ChatService;

import java.util.List;

@RestController
@RequestMapping("/api/chat")
@RequiredArgsConstructor
public class ChatController {

  private final ChatService chatService;

  @PostMapping("/rooms")
  public ResponseEntity<ChatRoom> createRoom(@RequestParam String user1Id,
      @RequestParam String user2Id) {
    return ResponseEntity.ok(chatService.createChatRoom(user1Id, user2Id));
  }

  @GetMapping("/rooms/{userId}")
  public ResponseEntity<List<ChatRoom>> getRooms(@PathVariable String userId) {
    return ResponseEntity.ok(chatService.getUserChatRooms(userId));
  }

  @GetMapping("/messages/{roomId}")
  public ResponseEntity<List<ChatMessage>> getMessages(@PathVariable String roomId,
      @RequestParam(defaultValue = "0") int page) {
    return ResponseEntity.ok(chatService.getChatMessages(roomId, page));
  }

  @GetMapping("/rooms/{roomId}/messages")
  public ResponseEntity<List<ChatMessage>> getRoomMessages(
      @PathVariable String roomId,
      @RequestParam(defaultValue = "0") int page) {
    return ResponseEntity.ok(chatService.getChatMessages(roomId, page));
  }

  @GetMapping("/rooms/{roomId}/unread")
  public ResponseEntity<Integer> getUnreadCount(@PathVariable String roomId,
      @RequestParam String userId) {
    int unreadCount = chatService.getUnreadMessageCount(roomId, userId);
    System.out.println("Unread count for room " + roomId + ", user " + userId + ": " + unreadCount);
    return ResponseEntity.ok(unreadCount);
  }

  @PostMapping("/rooms/{roomId}/read")
  public ResponseEntity<Void> markAsRead(@PathVariable String roomId,
      @RequestParam String userId) {
    chatService.markMessagesAsRead(roomId, userId);
    return ResponseEntity.ok().build();
  }

  @PostMapping("/rooms/{roomId}/enter")
  public ResponseEntity<Void> enterRoom(@PathVariable String roomId,
      @RequestParam String userId) {
    chatService.markMessagesAsRead(roomId, userId);
    return ResponseEntity.ok().build();
  }
}
