import 'dart:convert';
import 'dart:developer';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/favourite_model.dart';
import 'package:be_healthy/model/popular_model.dart';
import 'package:be_healthy/model/video_data_model.dart';
import 'package:be_healthy/view/strength_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WorkoutController extends GetxController {
  Map isFavorite = {};
  late PageController pageController;
  // late CardWorkoutModel cardWorkoutModel;
  MyServices myServices = Get.find();
  bool isFav = false;
  bool isFav2 = false;
  bool isLoading = false;
  late PopularModel popularModel = PopularModel();

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  List<String> images = [
    "assets/images/Rectangle1.png",
    "assets/images/Rectangle3.png",
    "assets/images/Rectangle1.png",
  ];

  goToPageStrength(String cat) {
    Get.to(const StrengthScreen(), arguments: {"cat": cat});
  }

  isFavourite() {
    isFav = !isFav;
    isFav2 = !isFav2;

    update();
  }

  getData() async {
    isLoading = true;
    update();
    final response = await http.get(
      Uri.parse(AppLink.pouplar),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${myServices.sharedPreferences.getString("token")}',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      popularModel = PopularModel.fromJson(jsonResponse);
      log("Data: $jsonResponse");
    }
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    update();
    getData();
    super.onInit();
    pageController = PageController(
      viewportFraction: .87,
    );
  }
}
