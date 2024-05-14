import 'package:be_healthy/model/onboarding_model.dart';
import 'package:be_healthy/view/strength_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class WorkoutController extends GetxController {
  late PageController pageController;
  // late CardWorkoutModel cardWorkoutModel;
  bool isFav = false;
  bool isFav2 = false;

  List<String> images = [
    "assets/images/Rectangle1.png",
    "assets/images/Rectangle3.png",
    "assets/images/Rectangle1.png",
  ];

  goToPageStrength(String cat) {
    Get.to(const StrengthScreen(),arguments: {"cat" :cat});
  }

  isFavourite() {
    isFav = !isFav;
    isFav2 = !isFav2;

    update();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
      viewportFraction: .87,
    );
  }
}
