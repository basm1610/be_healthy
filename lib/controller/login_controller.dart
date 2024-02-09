import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/class/curd.dart';
import 'package:be_healthy/data/remote/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  Crud curd = Crud();
  SignupData signupData = SignupData(Get.put(Crud()));
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController password;
  late bool isHiddenn = true;
  obscurePassword() {
    isHiddenn = !isHiddenn;
    update();
  }
  // statuscode 201 when created user
  // statuscode 200 ok success login

   var  apiUrl = "http://localhost:3000/login";
  // login() async {
  //   http.post(Uri.parse("http://localhost:3000/register"));

  //   update();
  // }

  Future<void> sendPostRequest() async {
    var response = await http.post(Uri.parse('http://192.168.1.7:3000/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username.text,
          "password": password.text,
        }));
    if (response.statusCode == 200) {
      log("success");
    } else {
      log("fiald");
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
