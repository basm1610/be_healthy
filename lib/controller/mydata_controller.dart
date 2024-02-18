import 'dart:developer';

import 'package:be_healthy/view/auth/login_screen.dart';
import 'package:be_healthy/view/mydata/screen_two.dart';
import 'package:get/get.dart';

class MyDataController extends GetxController {
  int number = 0;
  String isMale = "male";
  int isAge = 20;
  int isHeight = 170;
  int isWeigth = 80;
  final List<String> items = [
    'In active : no exercise',
    'light : 1-3 days per weak',
    'middle : 3-5 days per weak',
    'heavy : 5-7 days per weak',
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
    Get.to(() => const ScreenTwo());
  }

  goTologin() {
    Get.offAll(() => const LoginScreen());
  }

  @override
  void onInit() {
    number = isAge;
    isMale = "";
    super.onInit();
  }
}
