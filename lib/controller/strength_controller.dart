import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/model/workout_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StrengthController extends GetxController {
  bool isLoading = false;
  String level = "beginner" ;
  WorkOutModel workOutModel = WorkOutModel();
  late String category;
  getData() async {
    isLoading = true;
    update();
    final response =
        await http.get(Uri.parse("${AppLink.training}$level&category=${category.toLowerCase()}"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      workOutModel = WorkOutModel.fromJson(jsonResponse);
      log("Data: $jsonResponse");
    }
    isLoading = false;
    update();
    log("category is: ${category}");

  }

  goToScreenVideo(String id) {
    Get.toNamed(AppRouts.videoScreen, arguments: {"id": id});
  }
  
  @override
  void onInit() {
    category = Get.arguments['cat'];
    log("category:  ${category.toLowerCase()}");
    log("level is: ${level}");
    getData();
    super.onInit();
  }
}
