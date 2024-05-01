import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_deseases_client/features/chatbot/service/message_service.dart';
import 'package:plant_deseases_client/models/Message.dart';

final messagesRepositoryProvider = Provider<MessagesRepository>((ref) {
  final messagesAPIService = ref.read(messagesAPIServiceProvider);
  return MessagesRepository(messagesAPIService);
});

class MessagesRepository {
  MessagesRepository(this.messagesAPIService);

  final MessagesAPIService messagesAPIService;

  Future<List<Message>> getMessages() {
    return messagesAPIService.getMessages();
  }

  Future<Message> getMessage(String messageId) {
    return messagesAPIService.getMessage(messageId);
  }

  Future<void> add(Message message) async {
    return messagesAPIService.addMessage(message);
  }

  Future<void> deleteMessage(Message message) async {
    return messagesAPIService.deleteMessage(message);
  }

  Future<void> deleteAllMessages(List<Message> messages) async {
    return messagesAPIService.deleteAllMessages(messages);
  }
}
