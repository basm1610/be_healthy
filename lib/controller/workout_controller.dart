import 'package:be_healthy/view/strength_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class WorkoutController extends GetxController {
  late PageController pageController;
  bool isFav = false;
  bool isFav2 = false;

  List<String> images = [
    "assets/images/Rectangle1.png",
    "assets/images/Rectangle3.png",
    "assets/images/Rectangle1.png",
  ];

  goToPageStrength() {
    Get.to(const StrengthScreen());
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
