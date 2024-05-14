import 'dart:convert';
import 'dart:developer';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordController extends GetxController {
  late TextEditingController email;
  bool isLoading = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();


  // function is used to check email is already in database or not and connect this by backend
  Future<void> checkEmail() async {
    if (formState.currentState!.validate()) {
      isLoading = true; // using yo loading screen when data is upload.
      update();
      var response = await http.post(
          Uri.parse(AppLink.forgetPassword),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "email": email.text,
          }));
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 201 || response.statusCode == 200)
      {
        Get.toNamed(AppRouts.verifyCode,
            arguments: {"email": email.text});
        log("success");
      } 
      else if (jsonResponse['status'] == "fail")
      {
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
      } 
      else 
      {
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
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

}
