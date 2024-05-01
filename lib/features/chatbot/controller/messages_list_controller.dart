import 'dart:async';

import 'package:plant_deseases_client/features/chatbot/data/messages_repository.dart';
import 'package:plant_deseases_client/models/Message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messages_list_controller.g.dart';

@riverpod
class MessagesListController extends _$MessagesListController {
  Future<List<Message>> _fetchMessages() async {
    final messagesRepository = ref.read(messagesRepositoryProvider);
    final messages = await messagesRepository.getMessages();
    return messages;
  }

  @override
  FutureOr<List<Message>> build() async {
    return _fetchMessages();
  }

  Future<void> addMessage({
    required String messageContent,
    required String userType,
  }) async {
    final message = Message(
      message: messageContent,
      userType: userType,
    );

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final messagesRepository = ref.read(messagesRepositoryProvider);
      await messagesRepository.add(message);
      return _fetchMessages();
    });
  }

  Future<void> removeMessage({
    required Message message,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final messagesRepository = ref.read(messagesRepositoryProvider);
      await messagesRepository.deleteMessage(message);
      return _fetchMessages();
    });
  }

  Future<void> removeAllMessages({
    required List<Message> messages,
  }) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final messagesRepository = ref.read(messagesRepositoryProvider);

      await messagesRepository.deleteAllMessages(messages);

      return _fetchMessages();
    });
  }
}
