import 'dart:convert';
import 'dart:developer';
import 'package:be_healthy/controller/nutrition/nutrition_details_controller.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/food_all_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchFoodController extends GetxController {
  bool isLoading = false;
  bool isSearch = true;
  late TextEditingController search;
  FoodAllCategoryModel foodAllCategoryModel = FoodAllCategoryModel();
  MyServices myServices = Get.find();

  getData() async {
    isLoading = true;
    update();
    final response = await http.get(
      Uri.parse("${AppLink.searchAllFood}${search.text}"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'lang': '${myServices.sharedPreferences.getString("lang")}',
      },
    );
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (search.text != "") {
        isSearch = true;
        foodAllCategoryModel = FoodAllCategoryModel.fromJson(jsonResponse);
        log("Data: ${jsonResponse["data"]}");
      } else {
        isSearch = false;
        update();
        log("no data");
      }
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
    search = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }
}
