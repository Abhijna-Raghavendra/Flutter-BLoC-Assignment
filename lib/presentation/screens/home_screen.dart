import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:counter_app/presentation/UI/custom_button.dart';
import 'package:counter_app/presentation/UI/custom_text.dart';
import 'package:counter_app/logic/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/models/binary_model.dart';
import 'package:counter_app/resources/api_provider.dart';
import 'package:counter_app/services/local_storage_services.dart';
import 'package:counter_app/core/locator.dart';
import 'package:counter_app/main.dart';

int savedValue = 0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          savedValue = localStorageService.getValue();
          return BlocProvider<CounterBloc>(
              create: (context) => CounterBloc(savedValue),
              child: Scaffold(
                appBar: AppBar(
                  title: Center(child: Text(widget.title)),
                ),
                body: CounterPage(localStorageService: localStorageService),
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

class CounterPage extends StatelessWidget {
  final ApiProvider _client = ApiProvider();

  initState() async {
    await setupLocator();
    LocalStorageService localStorageService = locator<LocalStorageService>();
    savedValue = localStorageService.getValue();
  }

  final LocalStorageService localStorageService;
  CounterPage({
    Key? key,
    required this.localStorageService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _counter = 0;
    String? _binary = '0';
    savedValue = localStorageService.getValue();
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          localStorageService.saveValue(state.counterValue);
          return FutureBuilder<BinaryModel?>(
              future: _client.fetchBinaryList(number: state.counterValue),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  BinaryModel? data = snapshot.data;
                  if (data != null) {
                    _binary = data.converted;
                    _counter = state.counterValue;
                    return customText(_counter, _binary, 'success', context);
                  }
                }
                return customText(_counter, _binary, errorMessage, context);
              });
        },
      ),
    ]);
  }
}
