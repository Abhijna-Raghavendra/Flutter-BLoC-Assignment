import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:dio/dio.dart';
import 'package:counter_app/presentation/UI/custom_button.dart';
import 'package:counter_app/presentation/UI/custom_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;
  final String _binary = '0';

  /*void _incrementCounter() {
    _counter++;
  }

  void _binaryconverter() async {
    var dio = Dio();
    final response = await dio
        .get('https://networkcalc.com/api/binary/$_counter?from=10&to=2');
    setState(() {
      _binary = response.data["converted"];
    });
  }

  void _decrementCounter() async {
    _counter--;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: customText(_counter, _binary, context),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customButton('-', context),
            customButton('+', context),
          ],
        ),
      ),
    );
  }
}
