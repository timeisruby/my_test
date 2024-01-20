import 'package:flutter/material.dart';
import 'package:interval/screen/HomeScreen.dart';
import 'package:interval/screen/RoutineScreen.dart';
import 'package:interval/screen/SelectScreen.dart';
import 'package:interval/screen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Interval",
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/select': (context) => SelectScreen(),
        '/routine': (context) => RoutineScreen()
      },
    );
  }
}
