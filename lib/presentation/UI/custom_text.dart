import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customText(int _counter, String _binary, context){
  return ScreenUtilInit(
      designSize: const Size(360, 690),
  minTextAdapt: true,
  splitScreenMode: true,
  builder: (context, child) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Center(
        child: Text(
          'You have pushed the button this many times: ',
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.7,
            fontSize: 16.sp,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(28.sp),
        child: Text('$_counter',
            style: TextStyle(
              color: const Color.fromARGB(480, 88, 88, 88),
              fontSize: 35.sp,
            )),
      ),
      Text(
        '[$_binary]',
        style: TextStyle(
          fontSize: 16.sp,
        ),
      )
    ],
  );
      }
      );
}