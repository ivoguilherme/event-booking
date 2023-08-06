import 'package:event_booking/components/email_text_field.dart';
import 'package:event_booking/components/password_text_field.dart';
import 'package:event_booking/components/submit_button.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final _signInFormKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    void toggleVisiblePassword() {
      setState(
        () => _obscurePassword = !_obscurePassword,
      );
    }

    return Form(
      key: _signInFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: const Text(
              'Sign in',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const EmailTextField(),
          const SizedBox(
            height: 20,
          ),
          PasswordTextField(
            obscureText: _obscurePassword,
            onPressed: toggleVisiblePassword,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 40,
            ),
            alignment: Alignment.center,
            child: SubmitButton(label: 'SIGN IN', onPressed: () {}),
          )
        ],
      ),
    );
  }
}
