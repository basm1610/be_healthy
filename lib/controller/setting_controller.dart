import 'dart:developer';

import 'package:be_healthy/controller/home_controller.dart';
import 'package:be_healthy/controller/main_home_controller.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/core/localization/change_lang.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:get/get.dart';
import 'package:be_healthy/data/static/static.dart';

class SettingController extends GetxController {
  String selectedItem = "English";
  MyServices myServices = Get.find();
  LocaleController localeController = Get.find();
  HomeController homeController = Get.find();
  MainHomeController mainHomeController = Get.find();

  goToContactUsScreen() {
    Get.toNamed(AppRouts.contactus);
  }

  changelanguage(value) {
    selectedItem = value.toString();
    update();
    myServices.sharedPreferences.setString("text", value.toString());
    if (value == 'English'.tr) {
      localeController.changeLange("en");
      log("lang is: ${localeController.myServices.sharedPreferences.getString("lang")}");
      homeController.getNutritionData();
      mainHomeController.titleBottomBar;
      cardWorkoutList[0].title;
      cardWorkoutList[1].title;
      cardWorkoutList[2].title;
      cardWorkoutList[3].title;
      update();
    } else if (value == "Arabic".tr) {
      localeController.changeLange("ar");
      log("lang is: ${localeController.myServices.sharedPreferences.getString("lang")}");
      homeController.getNutritionData();
      mainHomeController.titleBottomBar;
      update();
    }
    update();
  }
}
