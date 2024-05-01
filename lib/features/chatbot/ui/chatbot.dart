import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_deseases_client/common/navigation/router/routes.dart';
import 'package:plant_deseases_client/common/utils/colors.dart';
import 'package:plant_deseases_client/features/chatbot/controller/messages_list_controller.dart';
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
    final messagesList = ref.watch(messagesListControllerProvider);

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
        body: switch (messagesList) {
          AsyncData(:final value) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            final message = value[index];
                            return BubbleMessage(
                              isTail: true,
                              message: message.message,
                              userType: UserType.sender,
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
                                ref
                                    .read(
                                        messagesListControllerProvider.notifier)
                                    .addMessage(
                                      messageContent: _controller.text,
                                      userType: UserType.sender.name,
                                    );
                                setState(() {
                                  _controller.text = '';
                                });
                              },
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text(
                                  'Are you sure to delete the chat?',
                                  style: TextStyle(fontSize: 20),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          ref
                                              .read(
                                                  messagesListControllerProvider
                                                      .notifier)
                                              .removeAllMessages(
                                                  messages: value)
                                              .then(
                                                (value) =>
                                                    Navigator.pop(context),
                                              );
                                        },
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 15),
                                        ),
                                      ),
                                      TextButton(
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                              color: Palette.primary,
                                              fontSize: 15),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 25,
                  // ),
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
