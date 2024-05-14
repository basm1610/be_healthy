import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/food_category_model.dart';
import 'package:be_healthy/view/calories._screen.dart';
import 'package:be_healthy/view/workout_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/model/workout_model.dart';

class HomeController extends GetxController {
  late PageController pageController;
  MyServices myServices = Get.find();
  WorkOutModel workOutModel = WorkOutModel();
  FoodCategoryModel foodCategoryModel = FoodCategoryModel();

  bool isLoading = false;

  var name;
  var email;

  List<String> images = [
    "assets/images/food3.png",
    "assets/images/food2.png",
    "assets/images/food1.png",
  ];

  List<String> imagesGym = [
    "assets/images/bed.png",
    "assets/images/bulb.png",
    "assets/images/chair.png",
    "assets/images/couch.png",
    "assets/images/rec.png",
  ];
  List<String> title = ["tahina salad", "Sauce Tonkatsu ", "meat"];

  goToCaliorsScreen() {
    Get.to(const CaloriesScreen())?.then((value) => update());
  }

  goToWorkOutScreen() {
    Get.to(const WorkOutScreen());
  }

  goToOrderScreen() {
    Get.toNamed(AppRouts.order);
  }
   goToNutritionScreen() {
    Get.toNamed(AppRouts.nutrition);
  }

  logout() {
    myServices.sharedPreferences.remove("step");

    Get.offAllNamed(AppRouts.login);
  }

  getData() async {
    isLoading = true;
    update();
    final response = await http.get(Uri.parse(AppLink.allTraining));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      workOutModel = WorkOutModel.fromJson(jsonResponse);
      log("Data: $jsonResponse");
    }
    isLoading = false;
    update();
  }

  getNutritionData() async {
    final response = await http.get(Uri.parse(AppLink.categoryFood));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      foodCategoryModel = FoodCategoryModel.fromJson(jsonResponse);
      log("Data: $jsonResponse");
      // log("image: ${jsonResponse['data'][0]['image']}");
    }
    update();
  }

  @override
  void onInit() {
    name = "${myServices.sharedPreferences.getString("name")}";
    email = "${myServices.sharedPreferences.getString("email")}";
    getData();
    getNutritionData();
    super.onInit();
    pageController = PageController(
      viewportFraction: .87,
    );
  }
}
