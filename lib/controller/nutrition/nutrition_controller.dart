import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/model/food_category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NutritionController extends GetxController {
  FoodCategoryModel foodCategoryModel = FoodCategoryModel();

  goToSearch() {
    Get.toNamed(AppRouts.searchNutrition);
  }

  getData() async {
    final response = await http.get(Uri.parse(AppLink.categoryFood));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      foodCategoryModel = FoodCategoryModel.fromJson(jsonResponse);
      log("Data: $jsonResponse");
      log("image: ${jsonResponse['data'] [0]['image']}");
    }
    update();
  }

  goToFoodDetails(String name, String id, String image) {
    Get.toNamed(AppRouts.nutritionDetails,
        arguments: {"name": name, "id": id, "image": image});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
