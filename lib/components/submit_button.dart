import 'package:event_booking/theme/colors.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  final void Function() onPressed;
  final String label;

  const SubmitButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  SubmitButtonState createState() {
    return SubmitButtonState();
  }
}

class SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 271,
      height: 58,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll(
              AppColors.primary,
            ),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(),
            ),
          ),
          onPressed: widget.onPressed,
          child: Stack(
            children: [
              Center(
                child: Text(
                  widget.label,
                  style: const TextStyle(
                    letterSpacing: 2,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 14,
                bottom: 14,
                right: 14,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.arrow_right_rounded),
                ),
              )
            ],
          )),
    );
  }
}
