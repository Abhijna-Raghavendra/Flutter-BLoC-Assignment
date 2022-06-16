import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:counter_app/presentation/UI/custom_button.dart';
import 'package:counter_app/presentation/UI/custom_text.dart';
import 'package:counter_app/logic/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/models/binary_model.dart';
import 'package:counter_app/resources/api_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
   String? _binary = '0';
  final ApiProvider _client = ApiProvider();

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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ BlocBuilder<CounterBloc, CounterState>(
                                builder: (context, state) {
                                  return FutureBuilder<BinaryModel?>(
                                                  future: _client.fetchBinaryList(number: state.counterValue),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            BinaryModel? data = snapshot.data;
                                            if (data != null) {
                                              _binary= data.converted;
                                              _counter=state.counterValue;
                                            }
                              
                                       }
                                       return const CircularProgressIndicator();
                                       } );
                                },
                              ),
                              customText(_counter, _binary, context),
                    ]
                              ) 
                  
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
