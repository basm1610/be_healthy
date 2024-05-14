import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ResetPasswordController extends GetxController {
  bool isLoading = false;
  late bool isPassword = true;
  late bool isConfirmPassword = true;
  late TextEditingController password;
  late TextEditingController rePassword;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String? email;

  // method is used to unhidden the textfield password
  obscurePassword() {
    isPassword = !isPassword;
    update();
  }

  // method is used to unhidden the textfield confirm password
  obscureConfirmPassword() {
    isConfirmPassword = !isConfirmPassword;
    update();
  }

  // this method is used to add new password in database using backend.
  Future<void> goToSuccessResetPassword() async {
    if (password.text != rePassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }
    if (formState.currentState!.validate()) {
      isLoading = true; // using yo loading screen when data is upload
      update();
      var response = await http.put(Uri.parse(AppLink.rePassword),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"newPassword": password.text,"email":email}));
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.offNamed(AppRouts.successResetPassword);
        log("success");
      } else if (jsonResponse['status'] == "fail") {
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
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    rePassword.dispose();
    password.dispose();
    super.dispose();
  }
}
