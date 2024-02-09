import 'package:be_healthy/view/auth/login_screen.dart';
import 'package:be_healthy/view/onboarding/onboarding_screen.dart';
import 'package:be_healthy/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginScreen(),
      // SplashScreen(),
    );
  }
}
