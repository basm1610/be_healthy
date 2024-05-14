import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/food_all_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NutritionDetailsController extends GetxController {
  FoodAllCategoryModel foodAllCategoryModel = FoodAllCategoryModel();
  MyServices myServices = Get.find();
  bool isLoading = false;
  late String name;
  late String image;
  late String id;



  getData() async { 
    isLoading = true;
    update();
    final response = await http.get(Uri.parse("${AppLink.categoryAllFood}$id"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      // foodCategoryModel = FoodCategoryModel.fromJson(jsonResponse);
      // dataFood.addAll(jsonResponse['data']);
      // dataFood.addAll(jsonResponse['data']); //////////////////////
      // foodCategoryModel = FoodCategoryModel.fromJson(jsonResponse);
      // data = Data.fromJson(jsonResponse);
      foodAllCategoryModel = FoodAllCategoryModel.fromJson(jsonResponse);
      // List responseData = jsonResponse["data"];
      // dataFood.addAll(responseData.map((e) => FoodCategoryModel.fromJson(e)));
      log("Data: ${jsonResponse["data"]}");
      // log("Data Model: ${foodCategoryModel.name}");
    }
    isLoading = false;
    update();
  }

  Future<void> sendPostRequest(String numCalories) async {
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
          "caloriesAdded": numCalories,
        }));
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      log("success");
      log("response === ${response.body}");              
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
    name = Get.arguments["name"];
    image = Get.arguments["image"];
    id = Get.arguments["id"];
    getData();
    log("id: $id");
    super.onInit();
  }
}
