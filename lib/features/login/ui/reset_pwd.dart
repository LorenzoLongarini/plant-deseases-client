import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_deseases_client/common/navigation/router/routes.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({
    super.key,
    required this.email,
  });
  final String email;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  bool _isEnabled = false;
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isEnabled = _controller.text.isNotEmpty;
      });
    });
    _newPasswordController.addListener(() {
      setState(() {
        _isEnabled = _controller.text.isNotEmpty;
      });
    });
  }

  void _resetPassword(
      BuildContext context, String email, String password, String code) async {
    try {
      final res = await Amplify.Auth.confirmResetPassword(
        username: email,
        newPassword: password,
        confirmationCode: code,
      );
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            e.message,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      );
      return null;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _newPasswordController.dispose();
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
                    TextField(
                      controller: _newPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 4.0),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          child: Icon(_isObscured
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onTap: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),
                        labelText: 'Enter new password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
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
                              _resetPassword(
                                context,
                                widget.email,
                                _controller.text,
                                _newPasswordController.text,
                              );
                            }
                          : null,
                      elevation: 4,
                      color: const Color.fromRGBO(137, 207, 90, .5),
                      disabledColor: const Color.fromRGBO(137, 207, 90, .8),
                      child: const Text(
                        'RESET',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
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
