import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

customTheme(context) {
  final customTheme = ThemeData(
    fontFamily: 'Press Start 2P',
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color.fromARGB(480, 88, 88, 88),
        secondary: Colors.white),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromARGB(480, 88, 88, 88),
        primary: Colors.white,
        fixedSize: Size.fromRadius(26.r),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero)),
      ),
    ),
  );
  return customTheme;
}
