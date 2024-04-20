import 'package:be_healthy/view/calories._screen.dart';
import 'package:be_healthy/view/order/order_screen.dart';
import 'package:be_healthy/view/workout_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  late PageController pageController;

  List<String> images = [
    "assets/images/food3.png",
    "assets/images/food2.png",
    "assets/images/food1.png",
  ];

  List<String> imagesGym = [
    "assets/images/bed.png",
    "assets/images/bulb.png",
    "assets/images/chair.png",
    "assets/images/couch.png",
    "assets/images/rec.png",
  ];
  List<String> title = ["tahina salad", "Sauce Tonkatsu ", "meat"];

  goToCaliorsScreen() {
    Get.to(const CaloriesScreen());
  }

  goToWorkOutScreen() {
    Get.to(const WorkOutScreen());
  }

  goToOrderScreen() {
    Get.to(const OrderScreen());
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
      viewportFraction: .87,
    );
  }
}
