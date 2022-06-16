import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:counter_app/logic/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

Widget customText(int _counter, String? _binary, bool status, context) {
  if (status == true) {
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
        BlocConsumer<CounterBloc, CounterState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(28.sp),
              child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text('ERROR ${state.counterValue}',
                        style: TextStyle(
                          color: const Color.fromARGB(480, 88, 88, 88),
                          fontSize: 35.sp,
                        ));
                  }
                  return Text(state.counterValue.toString(),
                      style: TextStyle(
                        color: const Color.fromARGB(480, 88, 88, 88),
                        fontSize: 35.sp,
                      ));
                },
              ),
            );
          },
        ),
        Text(
          'binary: [$_binary]',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        )
      ],
    );
  } else {
    return Column(
      children: [
        SizedBox(
            height: 150.r,
            width: 150.r,
            child: CircularProgressIndicator(
              strokeWidth: 10.sp,
            )),
      ],
    );
  }
}
