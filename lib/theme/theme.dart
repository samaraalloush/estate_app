import 'package:flutter/material.dart';
import 'package:estate2/constant/colors.dart';
import 'package:estate2/constant/fonts.dart';

final appTheme = ThemeData(
  primarySwatch: AppColors.primaryMaterialColor,
  scaffoldBackgroundColor: AppColors.whiteColor,
  appBarTheme: const AppBarTheme(
    color: AppColors.whiteColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontFamily: AppFonts.latoRegular,
      color: AppColors.primaryColor,
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 40,
      fontFamily: AppFonts.latoRegular,
      color: AppColors.primaryTextTextColor,
      fontWeight: FontWeight.w500,
      height: 1.6,
    ),
    displayMedium: TextStyle(
      fontSize: 32,
      fontFamily: AppFonts.latoRegular,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      height: 1.6,
    ),
    displaySmall: TextStyle(
      fontSize: 28,
      fontFamily: AppFonts.latoRegular,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      height: 1.6,
    ),
    headlineLarge: TextStyle(
      fontSize: 24,
      fontFamily: AppFonts.latoRegular,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      height: 1.6,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontFamily: AppFonts.latoRegular,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      height: 1.6,
    ),
    headlineSmall: TextStyle(
      fontSize: 17,
      fontFamily: AppFonts.latoBold,
      color: AppColors.textPrimary,
      height: 1.6,
    ),
    bodyLarge: TextStyle(
      fontSize: 17,
      fontFamily: AppFonts.latoRegular,
      color: AppColors.textPrimary,
      height: 1.6,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontFamily: AppFonts.latoRegular,
      color: AppColors.textPrimary,
      height: 1.6,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontFamily: AppFonts.latoBold,
      color: AppColors.textPrimary,
      height: 2.26,
    ),
  ),
);
