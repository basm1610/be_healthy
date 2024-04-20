import 'package:be_healthy/data/static/static.dart';
import 'package:be_healthy/view/auth/login_screen.dart';
import 'package:be_healthy/view/mydata/screen_one.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  late PageController pageController;
  int currentPage = 0;
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      Get.off(() => const ScreenOne() );
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

  // goToOnBoardingtwo() {
  //   Get.to(() => const OnBoardingTwo());
  // }

  // goToOnBoardingthree() {
  //   Get.to(() => const OnBoardingThree());
  // }

 

  goTologin() {
    Get.offAll(() => const LoginScreen());
  }
}
