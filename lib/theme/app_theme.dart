import 'package:event_booking/theme/colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primary,
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    prefixIconColor: AppColors.textFieldColor,
    contentPadding: const EdgeInsets.all(18.5),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.textFieldBorder,
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.textFieldBorder,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.primary,
        width: 1,
      ),
    ),
    labelStyle: const TextStyle(
      fontSize: 16,
      height: 1.64,
      fontWeight: FontWeight.bold,
      color: AppColors.textFieldColor,
    ),
  ),
);
