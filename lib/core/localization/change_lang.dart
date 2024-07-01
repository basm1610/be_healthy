import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:be_healthy/core/services/myservices.dart';

class LocaleController extends GetxController {
  Locale? language;
  bool isLang = false;
  MyServices myServices = Get.find();

  changeLange(String langCode) {
    isLang = !isLang;
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    log("lang is: ${myServices.sharedPreferences.getString("lang")}");

    if (sharedPrefLang == "ar") {
      isLang = true;
      language = const Locale("ar");
      update();
    } else if (sharedPrefLang == "en") {
      isLang = false;
      language = const Locale("en");
      update();
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      isLang;
      update();
    }
    super.onInit();
  }
}
