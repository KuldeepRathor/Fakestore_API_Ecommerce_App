// app_theme.dart

import 'package:fakestore_api_ecommerce_platform/model/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.transparent,
        cursorColor: AppColors.purple,
        selectionHandleColor: AppColors.purple,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
        actionsIconTheme: IconThemeData(
          color: AppColors.purple,
        ),
        iconTheme: IconThemeData(
          color: AppColors.purple,
        ),
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: AppColors.purple,
          fontSize: 16,
          fontStyle: FontStyle.normal,
        ),
        headline1: TextStyle(
          fontSize: 30,
          color: AppColors.purple,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 20,
          color: AppColors.purple,
          fontWeight: FontWeight.bold,
        ),
        headline3: TextStyle(
          fontSize: 18,
          color: AppColors.purple,
          fontWeight: FontWeight.bold,
        ),
      ),
      hintColor: AppColors.purple,
      shadowColor: AppColors.purple,
      focusColor: AppColors.purple,
      inputDecorationTheme: const InputDecorationTheme(
        focusColor: AppColors.purple,
        labelStyle: TextStyle(
          color: AppColors.purple,
        ),
        border: InputBorder.none,
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        iconColor: AppColors.purple,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.purple,
          shadowColor: AppColors.purple,
          side: const BorderSide(
            color: AppColors.purple,
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.purple,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.purple,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.purple,
      ),
    );
  }
}
