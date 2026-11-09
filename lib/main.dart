import 'package:flutter/material.dart';
import 'package:space/core/route/app_routes.dart';
import 'package:space/ui/screens/home_screens.dart';
import 'package:space/ui/screens/login_screens.dart';
import 'package:space/ui/screens/planetD_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AppRoutes.login: (_) => LoginScreens(),
        AppRoutes.home: (_) => HomeScreens(),
      },
      initialRoute: AppRoutes.login,
    );
  }
}
