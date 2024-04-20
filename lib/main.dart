import 'package:be_healthy/binding.dart';
import 'package:be_healthy/core/localization/change_lang.dart';
import 'package:be_healthy/core/localization/translation.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/view/auth/login_screen.dart';
import 'package:be_healthy/view/calories._screen.dart';
import 'package:be_healthy/view/home_screen.dart';
import 'package:be_healthy/view/main_home.dart';
import 'package:be_healthy/view/test/test.dart';
import 'package:be_healthy/view/splash_screen.dart';
import 'package:be_healthy/view/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'view/order/order_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

//        width is :360.0
//        height is:741.3333333333334

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.interTextTheme(),
          scaffoldBackgroundColor: Colors.white,
          cardColor: Colors.amber),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: Locale("en"),
      // controller.language,
      translations: MyTranslation(),
      initialBinding: MyBinding(),
      home: 
      // WorkOutScreen(),
      // MainHomeScreen(),
      //  LoginScreen(),
      // OrderScreen(),
      
      const SplashScreen(),
      // HomeScreen(),
    );
  }
}
