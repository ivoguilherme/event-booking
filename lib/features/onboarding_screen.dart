import 'package:event_booking/common/storage_key.dart';
import 'package:event_booking/features/signin_screen.dart';
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
  int _currentIndex = 0;

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

  Future<void> storeHideOnBoardingValue(
      {required Function(bool) onSuccess}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(StorageKey.hideOnBOarding, true).then(onSuccess);
  }

  Future<void> redirectSignInScreen() async {
    await Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (_) => const SignInScreen(),
        ));
  }

  Future<void> onNextPressed() async {
    if (_currentIndex < items.length - 1) {
      return setState(() => _currentIndex += 1);
    }

    await storeHideOnBoardingValue(
        onSuccess: (_) async => await redirectSignInScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          _buildImage(items[_currentIndex].image),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(48.0),
                  topRight: Radius.circular(48.0)),
              color: AppColors.primary,
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                _buildTitle(items[_currentIndex].title),
                _buildDescription(items[0].description),
                _buildButtons()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(AssetImage image) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Image(image: image),
    ));
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 22.0,
          height: 1.54,
          fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescription(String description) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 40),
      child: Text(
        description,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15.0,
          height: 1.66,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          width: index == _currentIndex ? 9 : 8,
          height: index == _currentIndex ? 9 : 8,
          decoration: BoxDecoration(
            color: index == _currentIndex
                ? const Color(0xFFFFFFFF)
                : const Color(0x4FFFFFFF),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: redirectSignInScreen,
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
          child: _buildDots(),
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
    );
  }
}
