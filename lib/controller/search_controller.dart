import 'dart:convert';
import 'dart:developer';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/model/food_all_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchFoodController extends GetxController {
  bool isLoading = false;
  bool isSearch = true;
  late TextEditingController search;
  FoodAllCategoryModel foodAllCategoryModel = FoodAllCategoryModel();

  
  getData() async {
    isLoading = true;
    update();
    final response =
        await http.get(Uri.parse("${AppLink.searchAllFood}${search.text}"));
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
