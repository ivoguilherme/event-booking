import 'package:event_booking/theme/image_source.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
