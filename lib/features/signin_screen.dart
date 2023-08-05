import 'package:event_booking/components/signin_form.dart';
import 'package:event_booking/theme/image_source.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsetsDirectional.only(top: 70),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Container(
                height: 114,
                margin: const EdgeInsets.only(bottom: 30),
                child: Image.asset(
                  ImageSource.mediumLogo,
                ),
              ),
              const SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
