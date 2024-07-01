import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/view/account_screen.dart';
import 'package:be_healthy/view/home_screen.dart';
import 'package:be_healthy/view/nutrition/nutrition.dart';
import 'package:be_healthy/view/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainHomeController extends GetxController {
  int currentIndex = 0;
  MyServices myServices = Get.find();

  List<dynamic> listPage = [
    const HomeScreen(),
    // Get.toNamed(AppRouts.calories),
    // const CaloriesScreen(),
    const NutritionScreen(),
    const WorkOutScreen(),
    const AccountScreen(),
  ];
  List titleBottomBar = [
    "Home".tr,
    "Nutrition".tr,
    "Workouts".tr,
    "Account".tr,
  ];
  List<IconData> iconBottomBar = [
    Icons.home,
    FontAwesomeIcons.nutritionix,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.user,
  ];

  onChangePage(int i) {
    currentIndex = i;
    update();
  }
}
