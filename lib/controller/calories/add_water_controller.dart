import 'dart:convert';
import 'dart:developer';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddWaterController extends GetxController {
  bool isLoading = false;
  MyServices myServices = Get.find();
  late TextEditingController addWater;
 
  Future<void> sendPostRequest() async {
    isLoading = true;
    update();

    var response = await http.post(Uri.parse(AppLink.addWaterAndCalorie),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${myServices.sharedPreferences.getString("token")}',
        },
        body: jsonEncode({"waterQuantity": addWater.text}));
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      log("success");
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
      log("response === ${response.body}");
      // log("response === ${jsonResponse['token']}");
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
  }

  @override
  void onInit() {
    addWater = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    addWater.dispose();
    super.dispose();
  }
}
