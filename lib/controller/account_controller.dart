import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/controller/test/test_controller.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AccountController extends GetxController {
  bool isLoading = false;

  MyServices myServices = Get.find();
  late TextEditingController emaill;
  late TextEditingController phonee;
  late TextEditingController namee;
  late TextEditingController currentPass;
  late TextEditingController newPass;
  late TextEditingController confirmPass;
  late bool isCurrentPassword = true;
  late bool isNewPassword = true;
  late bool isConfirmPassword = true;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final ConnectivityService connectivityService = Get.find();
  UserModel userModel = UserModel();

  // method is used to unhidden the textfield password
  obscureCurrentPassword() {
    isCurrentPassword = !isCurrentPassword;
    update();
  }

  // method is used to unhidden the textfield password
  obscurePassword() {
    isNewPassword = !isNewPassword;
    update();
  }

  // method is used to unhidden the textfield confirm password
  obscureConfirmPassword() {
    isConfirmPassword = !isConfirmPassword;
    update();
  }

  Future<void> updateUser() async {
    // log("basssssssssssssssssssm");
    // emaill.text.isEmpty?
    //   log("$email")
    // :log(emaill.text);
    log("${myServices.sharedPreferences.getString("token")}");

    if (formState.currentState!.validate()) {
      isLoading = true;
      update();
      if (connectivityService.isConnected) {
        var response = await http.put(Uri.parse(AppLink.updateUser),
            headers: {
              "Content-Type": "application/json",
              'Authorization':
                  'Bearer ${myServices.sharedPreferences.getString("token")}',
            },
            body: jsonEncode({
              // "email":"basm.mohamed112@gmail.com",
              // "email": emaill.text.isEmpty ? email : emaill.text,
              "name": namee.text.isEmpty ? userModel.data?.name : namee.text,
              "phone":
                  phonee.text.isEmpty ? userModel.data?.phone : phonee.text,
            }));
        var jsonResponse = jsonDecode(response.body);
        if (response.statusCode == 201 || response.statusCode == 200) {
          Get.snackbar(
            snackPosition: SnackPosition.BOTTOM,
            "attention",
            "Your personal data has been updated",
            duration: const Duration(seconds: 2),
            icon: const Icon(
              Icons.check_circle_rounded,
              size: 35,
            ),
          );
          getData();
          update();
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
          log("fiald");
        }
        isLoading = false;
        update();
      }
    }
  }

  Future<void> updateUserPassword() async {
    // log("basssssssssssssssssssm");
    // emaill.text.isEmpty?
    //   log("$email")
    // :log(emaill.text);
    log("${myServices.sharedPreferences.getString("token")}");

    if (formState.currentState!.validate()) {
      isLoading = true;
      update();
      if (connectivityService.isConnected) {
        var response = await http.put(Uri.parse(AppLink.updateUserPassword),
            headers: {
              "Content-Type": "application/json",
              'Authorization':
                  'Bearer ${myServices.sharedPreferences.getString("token")}',
            },
            body: jsonEncode({
              // "email":"basm.mohamed112@gmail.com",
              // "email": emaill.text.isEmpty ? email : emaill.text,
              "currentPassword": currentPass.text,
              "password": newPass.text,
              "passwordConfirm": confirmPass.text,
            }));
        var jsonResponse = jsonDecode(response.body);
        if (response.statusCode == 201 || response.statusCode == 200) {
          Get.snackbar(
            snackPosition: SnackPosition.BOTTOM,
            "attention",
            "Your personal data has been updated",
            duration: const Duration(microseconds: 1000),
            icon: const Icon(
              Icons.check_circle_rounded,
              size: 35,
            ),
          );
          myServices.sharedPreferences.remove("step");

          Get.offAllNamed(AppRouts.login);
          // update();
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
          log("fiald");
        }
        isLoading = false;
        update();
      }
    }
  }

  getData() async {
    isLoading = true;
    update();
    if (connectivityService.isConnected) {
      final response = await http.get(
        Uri.parse(AppLink.getUser),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${myServices.sharedPreferences.getString("token")}',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        log("Data: $jsonResponse");
        userModel = UserModel.fromJson(jsonResponse);
      }
      isLoading = false;
      update();
    } else {
      log("Not connect");
    }
  }

  @override
  void onInit() {
    phonee = TextEditingController();
    namee = TextEditingController();
    currentPass = TextEditingController();
    newPass = TextEditingController();
    confirmPass = TextEditingController();
    super.onInit();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    phonee.dispose();
    namee.dispose();
    currentPass.dispose();
    newPass.dispose();
    confirmPass.dispose();
  }
}
