import 'package:be_healthy/controller/splash_controller.dart';
import 'package:be_healthy/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      // backgroundColor: const Color(0xffDBB3FB),
      // appBar: AppBar(),

      body: Center(child: LogoWidget()),
    );
  }
}
