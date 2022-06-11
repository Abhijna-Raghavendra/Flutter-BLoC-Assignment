import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Counter App',
            theme: ThemeData(
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
            ),
            home: const MyHomePage(title: 'Counter App'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _binary = '0';

  void _incrementCounter() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                _decrementCounter();
                _binaryconverter();
              },
              child: Text(
                '-',
                style: TextStyle(
                  fontSize: 24.sp,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _incrementCounter();
                _binaryconverter();
              },
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 24.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
