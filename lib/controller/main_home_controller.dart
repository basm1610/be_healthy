import 'package:be_healthy/view/calories._screen.dart';
import 'package:be_healthy/view/home_screen.dart';
import 'package:be_healthy/view/nutrition/nutrition.dart';
import 'package:be_healthy/view/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';

class MainHomeController extends GetxController {
  int currentIndex = 0;

  List<Widget> listPage = [
    const HomeScreen(),
    // Center(child: const Text("Home")),
    // Center(child: const Text("Caloris")),
    const CaloriesScreen(),
    const NutritionScreen(),
    // Center(child: const Text("Nutrition")),
    // Center(child: const Text("Workout")),
    const WorkOutScreen(),
    // const Text("Account"),
  ];
  List titleBottomBar = [
    "home",
    "Caloris",
    "Nutrition",
    "Workout",
    // "Account",
  ];
  List<IconData> iconBottomBar = [
    Icons.home,
    FontAwesomeIcons.mandalorian,
    FontAwesomeIcons.nutritionix,
    // Icons.water_rounded,
    Icons.work_outline,
    // Icons.person
  ];

  onChangePage(int i) {
    currentIndex = i;
    update();
  }
}
