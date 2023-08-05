import 'package:event_booking/components/submit_button.dart';
import 'package:event_booking/theme/colors.dart';
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
  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
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
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: AppColors.primary,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.alternate_email_rounded,
                size: 22,
              ),
              labelText: 'emai@email.com',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            cursorColor: AppColors.primary,
            obscureText: _visiblePassword,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock_outline_rounded,
                size: 22,
              ),
              suffixIcon: IconButton(
                onPressed: () => setState(
                  () => _visiblePassword = !_visiblePassword,
                ),
                icon: Icon(
                    _visiblePassword ? Icons.visibility_off : Icons.visibility),
                color: AppColors.textFieldColor,
              ),
              labelText: 'Your password',
            ),
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
