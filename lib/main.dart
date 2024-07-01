import 'dart:io';
import 'package:be_healthy/binding.dart';
import 'package:be_healthy/controller/test/test_controller.dart';
import 'package:be_healthy/core/constant/app_theme.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/core/localization/change_lang.dart';
import 'package:be_healthy/core/localization/translation.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/core/services/notification_service.dart';
import 'package:be_healthy/routs.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:be_healthy/controller/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await NotificationService.initializeNotification();
  await initialServices();
  await initServices();
  await Get.putAsync<ConnectivityService>(() async => ConnectivityService());

  HttpOverrides.global = MyHttpOverrides();
  Get.put(ThemeController());
  runApp(const MyApp());
}

//        width is :360.0
//        height is:741.3333333333334
Future<void> initServices() async {
  await Get.putAsync<NetworkService>(() async => NetworkService());
  // await Get.putAsync<CheckInternetController>(
  //     () async => CheckInternetController());
  await Get.putAsync<ConnectivityService>(() async => ConnectivityService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());

    return ScreenUtilInit(
      designSize: const Size(360,750),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(_,child)=>GetBuilder<ThemeController>(
        builder: (controller) => GetMaterialApp(
            useInheritedMediaQuery: true,
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            // theme: ThemeData(
            //     appBarTheme: AppBarTheme(
            //       backgroundColor: AppColor.primaryColor,
            //         centerTitle: true,
            //         titleTextStyle: TextStyle(
            //           color: Colors.white,
            //           fontSize: 20,
            //         ),
            //         iconTheme: IconThemeData(color: Colors.white)),
            //     useMaterial3: true,
            //     // textTheme: GoogleFonts.interTextTheme(),
            //     scaffoldBackgroundColor: Colors.white,
            //     cardColor: Colors.amber),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            locale: localeController.language,
            // locale: Locale("en"),
            // themeMode: ThemeMode.dark,
            // theme: ThemeData.dark(),
            // darkTheme: ThemeData(brightness: Brightness.dark),
            // controller.language,
            theme: lightMode
            // ThemeData.light()
            ,
            
            darkTheme: darkMode
            // ThemeData.dark()
            ,
            themeMode:
                controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
            translations: MyTranslation(),
            initialBinding: MyBinding(),
            // home:
                // AudioScreen(),
                // StepsCount(),
                // const StepssScreen(),
                // NotificationScreen()
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
            // const TestScreen(),
            // HomeScreen(),
            getPages: routs,
            ))
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
