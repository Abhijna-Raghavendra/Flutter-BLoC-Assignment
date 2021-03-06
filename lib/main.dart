import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:counter_app/presentation/UI/custom_theme.dart';
import 'package:counter_app/presentation/screens/home_screen.dart';
import 'core/locator.dart';
import 'services/local_storage_services.dart';

int savedValue = 0;

LocalStorageService localStorageService = locator<LocalStorageService>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  LocalStorageService localStorageService = locator<LocalStorageService>();
  savedValue = localStorageService.getValue();
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
            theme: customTheme(context),
            home: const MyHomePage(title: 'Counter App'),
          );
        });
  }
}
