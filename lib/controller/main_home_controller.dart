import 'package:be_healthy/view/account_screen.dart';
import 'package:be_healthy/view/home_screen.dart';
import 'package:be_healthy/view/nutrition/nutrition.dart';
import 'package:be_healthy/view/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainHomeController extends GetxController {
  int currentIndex = 0;

  List<dynamic> listPage = [
    const HomeScreen(),
    // Get.toNamed(AppRouts.calories),
    // const CaloriesScreen(),
    const NutritionScreen(),
     const WorkOutScreen(),
    const AccountScreen(),
  ];
  List titleBottomBar = [
    "home",
    "Nutrition",
    "Workout",
    "Account",
  ];
  List<IconData> iconBottomBar = [
    Icons.home,
    FontAwesomeIcons.nutritionix,
    Icons.work_outline,
    FontAwesomeIcons.user,
  ];

  onChangePage(int i) {
    currentIndex = i;
    update();
  }
}
