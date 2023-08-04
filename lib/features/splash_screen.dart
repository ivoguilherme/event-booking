import 'dart:async';

import 'package:event_booking/features/onboarding_screen.dart';
import 'package:event_booking/theme/image_source.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (context.mounted) {
      Timer(
          const Duration(seconds: 5),
          () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const OnBoardingScreen())));
    }

    return const Scaffold(
      body: Center(
        child: Image(
          width: 252.0,
          image: AssetImage(ImageSource.splashScreen),
        ),
      ),
    );
  }
}
