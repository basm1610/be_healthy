import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/controller/test/test_controller.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StrengthController extends GetxController {
  bool isLoading = false;
  String level = "Beginner".tr;
  WorkOutModel workOutModel = WorkOutModel();
  NetworkService networkService = Get.put(NetworkService());
  final ConnectivityService connectivityService = Get.find();
  MyServices myServices = Get.find();

  late String category;
  //  Map<String, String> cat= {
  //    : ""
  // }


  getData() async {
    log("cccccccccccccc ${category}");
    if (connectivityService.isConnected) {
      isLoading = true;
      update();
      final response = await http.get(
        Uri.parse("${AppLink.training}${level.tr}&category=${category.toLowerCase()}"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'lang': '${myServices.sharedPreferences.getString("lang")}',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        workOutModel = WorkOutModel.fromJson(jsonResponse);
        log("Data: $jsonResponse");
      }
      isLoading = false;
      update();
      log("category is: ${category}");
    } else {
      log("not connected");
    }
    update();
  }

  goToScreenVideo(String id,String name) {
    Get.toNamed(AppRouts.videoScreen, arguments: {"id": id, "name":name});
  }

  @override
  void onInit() async {
    category = Get.arguments['cat'];
    super.onInit();
    await getData();
  }
}
