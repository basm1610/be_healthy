import 'dart:convert';
import 'dart:developer';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MyDataController extends GetxController {
  int number = 0;
  String isGender = "male";
  int isAge = 20;
  int isHeight = 170;
  int isWeigth = 80;
  bool isLoading = false;
  late String token;

  final List<String> items = [
    "light : 1-3 days per week",
    "middle : 3-5 days per week",
    "heavy : 5-7 days per week"
  ];
  bool isSelected = false;
  String? selectedValue;
  String getValue = "";
  checkGenderMale() {
    isGender = "male";
    log("isMale");

    update();
  }

  getValueFromList() {
    if (items.indexOf(selectedValue.toString()) == 0) {
      getValue = "low";
    } else if (items.indexOf(selectedValue.toString()) == 1) {
      getValue = "medium";
    } else {
      getValue = "high";
    }
  }

  checkGenderFemale() {
    isGender = "female";
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
    if (isGender != "") {
      Get.toNamed(AppRouts.screenTwo);
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


  Future<void> sendPostRequest() async {
    if (selectedValue != null) {
      isLoading = true;
      update();

      var response = await http.post(Uri.parse(AppLink.collectData),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            "gender": isGender,
            "weight": isWeigth,
            "height": isHeight,
            "age": number,
            "activity": getValue,
          }));
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        log("success");
        Get.offAllNamed(AppRouts.home);
        log("response === ${response.body}");
      } else if (jsonResponse['status'] == "fail") {
        log("${jsonResponse['status']}");
        log("${jsonResponse['message']}");
        Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          "attention",
          "${jsonResponse['message']}",
          duration: const Duration(seconds: 2),
          icon: const Icon(
            Icons.error_rounded,
            size: 35,
          ),
        );
      } else {
        log("${response.statusCode}");
        log("fiald");
      }
      isLoading = false;
      update();
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
    token = Get.arguments['token'];
    log("items: $items");
    number = isAge;
    isGender = "";
    super.onInit();
  }
}
