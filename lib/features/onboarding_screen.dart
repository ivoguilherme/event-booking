import 'package:event_booking/theme/colors.dart';
import 'package:event_booking/theme/image_source.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Image(image: AssetImage(ImageSource.onBoarding1)),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(48.0),
                  topRight: Radius.circular(48.0)),
              color: AppColors.primary,
            ),
            width: MediaQuery.of(context).size.width,
            child: const Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Explore Upcoming and Nearby Events',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          height: 1.54,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      ' In publishing and graphic design, Lorem is a placeholder text commonly',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        height: 1.66,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
