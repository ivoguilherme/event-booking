import 'package:event_booking/features/splash_screen.dart';
import 'package:event_booking/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Home(),
      theme: appTheme,
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => const SplashScreen();
}
