import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  bool isLoading = false;
  MyServices myServices = Get.find();
  late double hasData;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late bool isHiddenn = true;

  obscurePassword() {
    isHiddenn = !isHiddenn;
    update();
  }

  goToForgetPassword() {
    Get.toNamed(AppRouts.forgetPassword);
  }
  // function is used to connected by backend to login
  Future<void> sendPostRequest() async {
    if (formState.currentState!.validate()) {
      isLoading = true;
      update();
      var response = await http.post(Uri.parse(AppLink.linkLogin),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "email": email.text,
            "password": password.text,
          }));
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        // add the user data to sharedPreferences
        myServices.sharedPreferences.setString("token", jsonResponse['token']);
        myServices.sharedPreferences
            .setString("name", jsonResponse['data']['name']);
        myServices.sharedPreferences
            .setString("email", jsonResponse['data']['email']);
        myServices.sharedPreferences
            .setString("phone", jsonResponse["data"]['phone']);
        // the sharedPreferences is used to check the user login before or not >>>> step "2" go to MainScreen
        myServices.sharedPreferences.setString("step","2");
        log("success");
        // this condition is used to check the user has a data for weight,height,age......
        jsonResponse['data']['haveData']
            ? Get.offNamed(AppRouts.home)
            : Get.offNamed(AppRouts.screenOne,
                arguments: {"token": jsonResponse['token']});
        
      } else if (jsonResponse['status'] == "fail") {
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
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
