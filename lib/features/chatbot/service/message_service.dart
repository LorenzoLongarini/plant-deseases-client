import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:plant_deseases_client/models/Message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

final messagesAPIServiceProvider = Provider<MessagesAPIService>((ref) {
  final service = MessagesAPIService();
  return service;
});

// final messagesStreamProvider = StreamProvider.autoDispose<List<Message>>((ref) {
//   final service = ref.watch(messagesAPIServiceProvider);
//   return service.subscribeToMessages();
// });

class MessagesAPIService {
  MessagesAPIService();

  Future<List<Message>> getMessages() async {
    try {
      final request = ModelQueries.list(Message.classType);
      final response = await Amplify.API.query(request: request).response;
      final messages = response.data?.items;

      if (messages == null) {
        safePrint('errors: ${response.errors}');
        return const [];
      }
      return messages.map((e) => e as Message).toList();
    } on Exception catch (error) {
      safePrint('fail $error');
      return const [];
    }
  }

  Future<void> addMessage(Message message) async {
    try {
      final request = ModelMutations.create(message);
      final response = await Amplify.API.mutate(request: request).response;

      final createdMessage = response.data;
      if (createdMessage == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
    } on Exception catch (error) {
      safePrint('failed: $error');
    }
  }

  Future<Message> getMessage(String messageId) async {
    try {
      final request = ModelQueries.get(
        Message.classType,
        MessageModelIdentifier(id: messageId),
      );
      final response = await Amplify.API.query(request: request).response;

      final message = response.data!;
      return message;
    } on Exception catch (error) {
      safePrint('getMessage failed: $error');
      rethrow;
    }
  }

  Future<void> deleteMessage(Message message) async {
    try {
      await Amplify.API
          .mutate(
            request: ModelMutations.delete(message),
          )
          .response;
    } on Exception catch (error) {
      safePrint('deleteTrip failed: $error');
    }
  }

  Future<void> deleteAllMessages(List<Message> messages) async {
    try {
      for (final Message message in messages) {
        await Amplify.API
            .mutate(
              request: ModelMutations.delete(message),
            )
            .response;
      }
    } on Exception catch (error) {
      safePrint('deleteTrip failed: $error');
    }
  }

  // Stream<List<Message>> subscribeToMessages() {
  //   final streamController = StreamController<List<Message>>();
  //   final request = ModelSubscriptions.onCreate(Message.classType);
  //   final stream = Amplify.API.subscribe(request);

  //   stream.listen((event) {
  //     if (event.data != null) {
  //       getMessages().then((messages) => streamController.add(messages));
  //     }
  //   }, onError: (error) {
  //     safePrint('Subscription failed: $error');
  //     streamController.addError(error); // Aggiungi l'errore al controller
  //   }, onDone: () {
  //     streamController
  //         .close(); // Chiudi il controller solo quando la sottoscrizione è completata
  //   });

  //   return streamController.stream;
  // }
}
