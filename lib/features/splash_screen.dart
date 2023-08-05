import 'dart:async';
import 'package:event_booking/common/storage_key.dart';
import 'package:event_booking/features/onboarding_screen.dart';
import 'package:event_booking/features/signin_screen.dart';
import 'package:event_booking/theme/image_source.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> getShowOnBoardingScreen() async {
    await Future.delayed(const Duration(seconds: 5));

    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return prefs.getBool(StorageKey.hideOnBOarding) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getShowOnBoardingScreen(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(
                child: Image(
                  width: 252.0,
                  image: AssetImage(ImageSource.splashScreen),
                ),
              ),
            );
          }

          return (snapshot.data == true)
              ? const SignInScreen()
              : const OnBoardingScreen();
        });
  }
}
