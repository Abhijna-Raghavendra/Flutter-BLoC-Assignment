import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:counter_app/logic/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget customButton(String text, context) {
  return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return TextButton(
          onPressed: () {
            if (text == '-') {
              BlocProvider.of<CounterBloc>(context).add(Decrement());
            } else if (text == '+') {
              BlocProvider.of<CounterBloc>(context).add(Increment());
            }
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24.sp,
            ),
          ),
        );
      });
}
