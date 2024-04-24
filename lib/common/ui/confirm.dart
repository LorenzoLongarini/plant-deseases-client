import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({
    super.key,
    required this.signupData,
  });
  final SignupData signupData;

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  TextEditingController _controller = TextEditingController();
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isEnabled = _controller.text.isNotEmpty;
      });
    });
  }

  void _verifyCode(BuildContext context, SignupData data, String code) async {
    try {
      final res = await Amplify.Auth.confirmSignUp(
        username: data.name!,
        confirmationCode: code,
      );
      print('1');
      if (res.isSignUpComplete) {
        print('2');

        await Amplify.Auth.signIn(
            username: data.name!, password: data.password);
        context.go(
          '/llm',
        );
      }
    } on AuthException catch (e) {
      print(data.name! + code);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(137, 207, 90, .5),
      body: Center(
        child: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 12,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 4.0),
                        prefixIcon: const Icon(Icons.lock),
                        labelText: 'Enter confirmation code',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: _isEnabled
                          ? () {
                              _verifyCode(
                                  context, widget.signupData, _controller.text);
                            }
                          : null,
                      elevation: 4,
                      color: const Color.fromRGBO(137, 207, 90, .5),
                      disabledColor: const Color.fromRGBO(137, 207, 90, .8),
                      child: const Text(
                        'VERIFY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: const Text(
                        'Resend code',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
