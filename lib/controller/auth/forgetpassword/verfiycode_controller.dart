import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VerifyCodeController extends GetxController {
  String? email;
  bool isLoading = false;

  // function is used to add verifyCode is sent by backend to your email
  Future<void> goToResetPassword(String verificationCode) async {
    isLoading = true;
    update();
    var response = await http.post(
        Uri.parse(AppLink.verifyCodePassword),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "resetCode": verificationCode,
        }));
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      Get.toNamed(AppRouts.resetPassword, arguments: {"email": email});
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

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

}
