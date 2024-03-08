import 'package:flutter/material.dart';
import 'package:pckode/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme:  AppBarTheme(
          centerTitle: true,
        elevation: 0,
                iconTheme: const IconThemeData(color: AppColor.primaryColr),
        backgroundColor: Colors.grey[50],
         titleTextStyle: const TextStyle(
          color: AppColor.primaryColr , 
          fontWeight: FontWeight.bold ,
          fontFamily: "Cairo",
           fontSize: 25)
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColr),
  fontFamily: 'PlayfairDisplay',
  textTheme: TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 27, color: AppColor.black),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: 'Cairo',
  textTheme: TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 27, color: AppColor.black),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);
