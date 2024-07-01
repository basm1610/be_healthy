import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/core/services/theme_services.dart';
import 'package:be_healthy/model/food_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ThemeController extends GetxController {
  // Use RxBool to listen to changes
  RxBool isDarkMode = false.obs;
  final ThemeService themeService = ThemeService();

  // ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    themeService.saveTheme(isDarkMode.value);
    update(); // Call update to refresh UI
  }

  MyServices myServices = Get.find();
  void _loadTheme() async {
    isDarkMode.value = await themeService.loadTheme();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
  FoodCategoryModel foodCategoryModel = FoodCategoryModel();

  // getData() async {
  //   final response = await http.get(
  //     Uri.parse("http://192.168.1.4:3000/api/v1/catFood"),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'lang': '${myServices.sharedPreferences.getString("lang")}',
  //     },
  //   );
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     var jsonResponse = jsonDecode(response.body);
  //     foodCategoryModel = FoodCategoryModel.fromJson(jsonResponse);
  //     log("Data: ${foodCategoryModel.dataTranslated?[0].name}");
  //     // log("image: ${jsonResponse['data'][0]['image']}");
  //   }
  //   update();
  // }

  @override
  void onInit() {
    super.onInit();
    _loadTheme();
    // getData();
  }
}
