import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customButton(String text, context){

  return ScreenUtilInit(
      designSize: const Size(360, 690),
  minTextAdapt: true,
  splitScreenMode: true,
  builder: (context, child) {
  return TextButton(
    onPressed: () {
    },
    child: Text(
      text,
      style: TextStyle(
        fontSize: 24.sp,
      ),
    ),
  );
      }
      );
}