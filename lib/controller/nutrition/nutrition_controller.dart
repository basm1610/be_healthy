import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/controller/test/test_controller.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/food_category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NutritionController extends GetxController {
  FoodCategoryModel foodCategoryModel = FoodCategoryModel();
  // NetworkService networkService = Get.put(NetworkService());
    final ConnectivityService connectivityService = Get.find();

  MyServices myServices = Get.find();

  goToSearch() {
    Get.toNamed(AppRouts.searchNutrition);
  }

  getData() async {
    if (connectivityService.isConnected) {
      final response = await http.get(
        Uri.parse(AppLink.categoryFood),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'lang': '${myServices.sharedPreferences.getString("lang")}',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        foodCategoryModel = FoodCategoryModel.fromJson(jsonResponse);
        log("Data: $jsonResponse");
        // log("image: ${jsonResponse['data'][0]['image']}");
      }
      update();
    } else {
      log("Not connect");
    }
  }

  goToFoodDetails(String name, String id, String image) {
    Get.toNamed(AppRouts.nutritionDetails,
        arguments: {"name": name, "id": id, "image": image});
  }

  @override
  void onInit() async {
    super.onInit();
    await getData();
  }
}
