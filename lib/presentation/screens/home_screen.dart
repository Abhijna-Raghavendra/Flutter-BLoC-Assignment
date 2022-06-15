import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:counter_app/presentation/UI/custom_button.dart';
import 'package:counter_app/presentation/UI/custom_text.dart';
import 'package:counter_app/logic/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;
  final String _binary = '0';

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider<CounterBloc>(
              create: (context) => CounterBloc(),
              child: Scaffold(
                appBar: AppBar(
                  title: Center(child: Text(widget.title)),
                ),
                body: Center(
                  child: customText(_counter, _binary, context),
                ),
                bottomNavigationBar: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customButton('-', context),
                      customButton('+', context),
                    ],
                  ),
                ),
              ));
        });
  }
}
