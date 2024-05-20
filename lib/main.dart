import 'dart:io';
import 'package:be_healthy/binding.dart';
import 'package:be_healthy/controller/test/test_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/core/localization/translation.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/routs.dart';
import 'package:be_healthy/view/auth/forgetpassword/reset_password_screen.dart';
import 'package:be_healthy/view/auth/login_screen.dart';
import 'package:be_healthy/view/auth/forgetpassword/success_resetpassword_screen.dart';
import 'package:be_healthy/view/nutrition/nutrition.dart';
import 'package:be_healthy/view/onboarding/onboarding_screen.dart';
import 'package:be_healthy/view/splash_screen.dart';
import 'package:be_healthy/view/calories._screen.dart';
import 'package:be_healthy/view/test/step_count.dart';
import 'package:be_healthy/view/test/test.dart';
import 'package:be_healthy/view/mydata/screen_one.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

//        width is :360.0
//        height is:741.3333333333334

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.primaryColor,
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              iconTheme: IconThemeData(color: Colors.white)),
          useMaterial3: true,
          // textTheme: GoogleFonts.interTextTheme(),
          scaffoldBackgroundColor: Colors.white,
          cardColor: Colors.amber),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: Locale("en"),
      // controller.language,
      translations: MyTranslation(),
      initialBinding: MyBinding(),
      // home:
      // StepsCount()
      // WorkOutScreen(),
      // MainHomeScreen(),
      //  LoginScreen(),
      // NutritionScreen()
      // const ScreenOne()
      // ResetPasswordScreen()
      // OrderScreen(),
      // OnBoardingScreen()
      // SuccessResetPasswordScreen()
      // const SplashScreen(),
      // CaloriesScreen()
      // TestScreen(),
      // HomeScreen(),
      getPages: routs,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
