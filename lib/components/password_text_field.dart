import 'package:event_booking/theme/colors.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final bool obscureText;
  final void Function() onPressed;

  const PasswordTextField({
    super.key,
    required this.obscureText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      cursorColor: AppColors.primary,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock_outline_rounded,
          size: 22,
        ),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          color: AppColors.textFieldColor,
        ),
        labelText: 'Your password',
      ),
    );
  }
}
