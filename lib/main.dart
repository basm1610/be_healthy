import 'dart:io';
import 'package:be_healthy/binding.dart';
import 'package:be_healthy/controller/test/test_controller.dart';
import 'package:be_healthy/core/constant/app_theme.dart';
import 'package:be_healthy/core/localization/change_lang.dart';
import 'package:be_healthy/core/localization/translation.dart';
import 'package:be_healthy/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:be_healthy/controller/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<ConnectivityService>(() async => ConnectivityService());
  Get.put(ThemeController());
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            locale: localeController.language,
            theme: lightMode
            ,
            darkTheme: darkMode
            ,
            themeMode:
                controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
            translations: MyTranslation(),
            initialBinding: MyBinding(),
            getPages: routs,
            ))
    );
  }
}


