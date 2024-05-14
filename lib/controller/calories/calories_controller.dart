import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/get_data_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CaloriesController extends GetxController {
  GetDataModel getDataModel = GetDataModel();
  late String data;
  MyServices myServices = Get.find();
  bool isLoading = false;
  double percentCalories = 0;
  double percentWater = 0;

  // function is used to get AllData
  getData() async {
    isLoading = true;
    update();
    final response = await http.get(
      Uri.parse(AppLink.getData),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${myServices.sharedPreferences.getString("token")}', // using token
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      getDataModel = GetDataModel.fromJson(jsonResponse);
      data = "${getDataModel.data?.caloriesAdded}";
      percentCalories = (jsonResponse['data']['caloriesAdded']) /
          (jsonResponse['data']['caloriesNeeded']);

      percentWater = (jsonResponse['data']['waterQuantity']) /
          (jsonResponse['data']['waterNeeded']);
      log("Data: $jsonResponse");
      log("percentWater: $percentCalories");
    }
    isLoading = false;
    update();
  }

  goToAddWater() {
    Get.toNamed(AppRouts.addWater);
  }

  Future<void> addWater() async {
    isLoading = true;
    update();
    var response = await http.post(Uri.parse(AppLink.addWaterAndCalorie),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${myServices.sharedPreferences.getString("token")}',
        },
        body: jsonEncode({
          "waterQuantity": "250",
        }));
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      log("success");
      log("response === ${response.body}");
      getData();
      Get.snackbar(
        snackPosition: SnackPosition.BOTTOM,
        "attention",
        "Add 250 ml of Water Success",
        duration: const Duration(seconds: 2),
        icon: const Icon(
          FontAwesomeIcons.clipboardCheck,
          size: 35,
        ),
      );
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
    // addWater();
    getData();
    super.onInit();
  }
}
