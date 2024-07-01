import 'dart:convert';
import 'dart:developer';
import 'package:be_healthy/controller/test/test_controller.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/favourite_model.dart';
import 'package:be_healthy/model/medatition_model.dart';
import 'package:be_healthy/model/video_data_model.dart';
import 'package:be_healthy/view/strength_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WorkoutController extends GetxController {
  Map isFavorite = {};
  late PageController pageController;
  MyServices myServices = Get.find();
  final ConnectivityService connectivityService = Get.find();

  bool isFav = false;
  bool isFav2 = false;
  bool isLoading = false;
  late MeditationModel meditationModel = MeditationModel();

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

  goToPageMeditation(String id,String name) {
    Get.toNamed(AppRouts.meditation,arguments: {"meditationId": id, "meditationName":name});
  }

  isFavourite() {
    isFav = !isFav;
    isFav2 = !isFav2;

    update();
  }

  getData() async {
    if (connectivityService.isConnected) {
      isLoading = true;
      update();
      final response = await http.get(
        Uri.parse(AppLink.medatition),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'lang':
              '${myServices.sharedPreferences.getString("lang")}',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        meditationModel = MeditationModel.fromJson(jsonResponse);
        log("Data: $jsonResponse");
      }
      isLoading = false;
      update();
    } else {
      log("Not connected");
    }
  }

  @override
  void onInit()  {
    super.onInit();
    pageController = PageController(
      viewportFraction: .87,
    );
     getData();
  }
}
