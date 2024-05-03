import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_deseases_client/common/navigation/router/routes.dart';
import 'package:plant_deseases_client/common/ui/custom_widgets/dialog/custom_alert_dialog.dart';
import 'package:plant_deseases_client/common/utils/colors.dart';
import 'package:plant_deseases_client/features/chatbot/controller/messages_list_controller.dart';
import 'package:plant_deseases_client/features/chatbot/service/message_service.dart';
import 'package:plant_deseases_client/features/chatbot/utils/constants/user_type.dart';
import 'package:plant_deseases_client/features/chatbot/ui/components/bottom_input_field.dart';
import 'package:plant_deseases_client/features/chatbot/ui/components/bubble_chat.dart';

class Chatbot extends ConsumerStatefulWidget {
  const Chatbot({super.key});
  @override
  ConsumerState<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends ConsumerState<Chatbot> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final messagesList = ref.watch(messageAPIServiceStreamProvider);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Palette.primary),
            onPressed: () => context.goNamed(AppRoute.home.name),
          ),
          // automaticallyImplyLeading: false,
          title: const Text('ChatBot'),
        ),
        body:
            // StreamBuilder(stream: messagesList.getMessages(),

            //  builder: builder)

            switch (messagesList) {
          AsyncData(:final value) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ListView.builder(
                          // reverse: true,
                          shrinkWrap: true,
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            final message = value[index];
                            return GestureDetector(
                              onLongPress: () => showDialog(
                                context: context,
                                builder: (context) => CustomAlertDialog(
                                  title: 'Are you sure to delete this message?',
                                  onPressed: () {
                                    ref
                                        .read(messagesListControllerProvider
                                            .notifier)
                                        .removeMessage(message: value[index]);
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              child: BubbleMessage(
                                isTail: true,
                                message: message.message,
                                userType: message.userType!,
                              ),
                            );
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: BottomInputField(
                              controller: _controller,
                              onPressed: () {
                                final currMess = _controller.text;
                                setState(() {
                                  _controller.text = '';
                                });
                                ref
                                    .read(
                                        messagesListControllerProvider.notifier)
                                    .addMessage(
                                      messageContent: currMess,
                                      userId: "1",
                                      userType: UserType.sender.name,
                                    )
                                    .then(
                                      (value) => ref
                                          .read(messagesListControllerProvider
                                              .notifier)
                                          .addMessage(
                                            userId: "1",
                                            messageContent: currMess,
                                            userType: UserType.chatbot.name,
                                          ),
                                    );
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => CustomAlertDialog(
                                  title: 'Are you sure to delete the chat?',
                                  onPressed: () {
                                    ref
                                        .read(messagesListControllerProvider
                                            .notifier)
                                        .removeAllMessages(messages: value);
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          AsyncError(:final error) => Text(
              error.toString(),
            ),
          _ => const Center(
              child: CircularProgressIndicator(),
            ),
        },
      ),
    );
  }
}
