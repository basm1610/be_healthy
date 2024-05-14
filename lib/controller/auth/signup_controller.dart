import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/class/curd.dart';
import 'package:be_healthy/core/class/status_request.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/remote/signup.dart';

import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  bool isLoading = false;
  late bool isPassword = true;
  late bool isConfirmPassword = true;
  Crud curd = Crud();
  SignupData signupData = SignupData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  StatusRequest? statusRequest = StatusRequest.none;

  obscurePassword() {
    isPassword = !isPassword;
    update();
  }

  obscureConfirmPassword() {
    isConfirmPassword = !isConfirmPassword;
    update();
  }

  // function is used to connected by backend to signup
  Future<void> sendPostRequest() async {
    if (formState.currentState!.validate()) {
      isLoading = true;
      update();
      var response = await http.post(Uri.parse(AppLink.linkSignUp),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": userName.text,
            "email": email.text,
            "password": password.text,
            "passwordConfirm": confirmPassword.text,
            "phone": phone.text,
          }));
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.offAllNamed(AppRouts.login);
        log("success");
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
        log("${jsonResponse['message']}");
        log("fiald");
      }
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    userName = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
