import 'package:event_booking/theme/colors.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.primary,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.alternate_email_rounded,
          size: 22,
        ),
        labelText: 'emai@email.com',
      ),
    );
  }
}
