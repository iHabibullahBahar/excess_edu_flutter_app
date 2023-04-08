import 'package:excess_edu/utils/routes.dart';
import 'package:excess_edu/views/pages/course_details_page.dart';
import 'package:excess_edu/views/pages/front_page.dart';
import 'package:excess_edu/views/pages/home_page.dart';
import 'package:excess_edu/views/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/theme/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      //darkTheme: ThemeData(brightness: Brightness.light),
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routes: {
        "/": (context) => FrontPage(),
        //"/": (context) => SplashScreen(),
        // "/": (context) => SplashScreen(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.frontPageRoute: (context) => FrontPage(),
      },
    );
  }
}
