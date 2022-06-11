import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                //primarySwatch: Color.fromARGB(480, 252, 189, 19),
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: const Color.fromARGB(480, 88, 88, 88),
                  secondary: const Color.fromARGB(480, 88, 88, 88),
                )),
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

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });
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
            const Center(
              child: Text(
                'You have pushed the button this many times: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.7,
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
        },
        tooltip: 'Increment',
        child: Text(
          '+',
          style: TextStyle(
            fontSize: 24.sp,
          ),
        ),
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      ),
    );
  }
}
