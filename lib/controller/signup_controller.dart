import 'dart:developer';

import 'package:be_healthy/core/class/curd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/remote/signup.dart';

class SignUpController extends GetxController {
  late bool isPassword = true;
  late bool isConfirmPassword = true;
  Crud curd = Crud();
  SignupData signupData = SignupData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController password;
  obscurePassword() {
    isPassword = !isPassword;
    update();
  }

  obscureConfirmPassword() {
    isConfirmPassword = !isConfirmPassword;
    update();
  }

  signUp() async {
    if (formState.currentState!.validate()) {
      update();
      var response = await signupData.postdata(password.text, username.text);
      print("=============================== Controller $response ");

      log("username:$username");
      log("username:$password");
      if (response['status'] == "success") {
        // data.addAll(response['data']);

        // Get.offNamed(AppRouts.login);
      } else {
        Get.defaultDialog(
            title: "ُWarning",
            middleText: "Phone Number Or Email Already Exists");
      }
      update();
    } else {}
  }
}
