import 'package:event_booking/common/storage_key.dart';
import 'package:event_booking/features/signup_screen.dart';
import 'package:event_booking/features/splash_screen.dart';
import 'package:event_booking/theme/colors.dart';
import 'package:event_booking/theme/image_source.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingItem {
  final String title;
  final String description;
  final AssetImage image;

  OnBoardingItem({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _idx = 0;

  final List<OnBoardingItem> items = [
    OnBoardingItem(
      title: 'Explore Upcoming and Nearby Events',
      description:
          'In publishing and graphic design, Lorem is a placeholder text commonly',
      image: const AssetImage(ImageSource.onBoarding1),
    ),
    OnBoardingItem(
      title: 'Web Have Modern Events Calendar Feature',
      description:
          'In publishing and graphic design, Lorem is a placeholder text commonly',
      image: const AssetImage(ImageSource.onBoarding2),
    ),
    OnBoardingItem(
      title: 'To Look Up More Events or Activities Nearby By Map',
      description:
          'In publishing and graphic design, Lorem is a placeholder text commonly',
      image: const AssetImage(ImageSource.onBoarding3),
    )
  ];

  Widget dotsList() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          3,
          (index) => Container(
            width: index == _idx ? 9 : 8,
            height: index == _idx ? 9 : 8,
            decoration: BoxDecoration(
              color: index == _idx
                  ? const Color(0xFFFFFFFF)
                  : const Color(0x4FFFFFFF),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      );

  void backToSplashScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const SplashScreen()));
  }

  Future<void> redirectSignUpScreen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs
        .setBool(StorageKey.hideOnBOarding, true)
        .then((value) => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) => const SignUpScreen(),
            )));
  }

  Future<void> onNextPressed() async {
    if (_idx < items.length - 1) {
      return setState(() {
        _idx += 1;
      });
    }

    await redirectSignUpScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Image(image: items[_idx].image),
          )),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(48.0),
                  topRight: Radius.circular(48.0)),
              color: AppColors.primary,
            ),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      items[_idx].title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          height: 1.54,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 40),
                    child: Text(
                      items[0].description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        height: 1.66,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: redirectSignUpScreen,
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                              color: Color(0x7FFFFFFF),
                              fontSize: 18,
                              height: 1.88,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        child: dotsList(),
                      ),
                      TextButton(
                        onPressed: onNextPressed,
                        child: const Text(
                          'Next',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 18,
                              height: 1.88,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
