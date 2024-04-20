import 'dart:developer';
import 'package:be_healthy/view/auth/login_screen.dart';
import 'package:be_healthy/view/mydata/screen_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDataController extends GetxController {
  int number = 0;
  String isMale = "male";
  int isAge = 20;
  int isHeight = 170;
  int isWeigth = 80;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  bool isSelected = false;
  String? selectedValue;
  checkGenderMale() {
    isMale = "male";
    log("isMale");

    update();
  }

  checkGenderFemale() {
    isMale = "female";
    log("isFemale");
    update();
  }

  add() {
    number++;
    update();
  }

  minus() {
    if (number > 0) {
      number--;
      update();
    }
  }

  changeDropDownButton(String? value) {
    selectedValue = value;
    update();
  }

  goToScreenTwoData() {
    if (isMale != "") {
      Get.to(() => const ScreenTwo());
    } else {
      Get.snackbar(
        "attention",
        "please complete this data of the Gender!",
        duration: const Duration(seconds: 2),
        icon: const Icon(
          Icons.error_rounded,
          size: 35,
        ),
      );
    }
  }

  goTologin() {
    if (selectedValue != null) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.snackbar(
        "attention",
        "please complete this data physical activity!",
        duration: const Duration(seconds: 2),
        icon: const Icon(
          Icons.error_rounded,
          size: 35,
        ),
      );
    }
  }

  @override
  void onInit() {
    number = isAge;
    isMale = "";
    super.onInit();
  }
}
