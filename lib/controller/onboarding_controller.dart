import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/data/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  late PageController pageController;
  int currentPage = 0;
  MyServices myServices = Get.find();

  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offNamed(AppRouts.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
  goTologin() {
    Get.offAllNamed(AppRouts.login);
  }
}
