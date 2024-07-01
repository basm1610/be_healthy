import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/controller/test/test_controller.dart';
import 'package:be_healthy/core/class/status_request.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/core/functions/check_internet.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/food_category_model.dart';
import 'package:be_healthy/model/popular_model.dart';
import 'package:be_healthy/view/calories._screen.dart';
import 'package:be_healthy/view/workout_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
  StatusRequest statusRequest = StatusRequest.none;
  final ConnectivityService connectivityService = Get.find();

  bool isLoading = false;

  var name;
  var email;

  goToCaliorsScreen() {
    Get.to(const CaloriesScreen())?.then((value) => update());
  }

  goToPopularScreen() {
    Get.toNamed(AppRouts.popular);
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

  goToFavouriteScreen() {
    Get.toNamed(AppRouts.favourite);
  }

  goToContactUsScreen() {
    Get.toNamed(AppRouts.contactus);
  }

  goToSettingScreen() {
    Get.toNamed(AppRouts.setting);
  }

  logout() {
    myServices.sharedPreferences.remove("step");

    Get.offAllNamed(AppRouts.login);
  }

  Future<void> getData() async {
    if (!connectivityService.isConnected) {
      try {
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
      } catch (e) {
        log("message $e");
      }
    } else {
      // Get.snackbar('No Internet', 'Please check your internet connection.');
      log("Not connect");
    }
    update();
  }

  getNutritionData() async {
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
      // Get.snackbar('No Internet', 'Please check your internet connection.');
      log("Not connect");
    }
    update();
  }

  @override
  void onInit() async {
    name = "${myServices.sharedPreferences.getString("name")}";
    email = "${myServices.sharedPreferences.getString("email")}";

    super.onInit();
    pageController = PageController(
      viewportFraction: .87,
    );
    await getData();
    await getNutritionData();
  }
}
