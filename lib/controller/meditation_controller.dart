import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/controller/test/test_controller.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/medatition_model.dart';
import 'package:be_healthy/model/video_data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MeditationController extends GetxController {
  bool isLoading = false;
  late String id;
  late String name;
  MyServices myServices = Get.find();
  final ConnectivityService connectivityService = Get.find();
  late VideoDataModel meditationModel = VideoDataModel();

  getData() async {
    if (connectivityService.isConnected) {
      isLoading = true;
      update();
      log("id is : $id");
      final response = await http.get(
        Uri.parse("${AppLink.trainingDetails}$id"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'lang': '${myServices.sharedPreferences.getString("lang")}',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        meditationModel = VideoDataModel.fromJson(jsonResponse);
        log("Data: $jsonResponse");
      }
      isLoading = false;
      update();
    } else {
      log("Not connected");
    }
  }

  @override
  void onInit() {
    id = Get.arguments['meditationId'];
    name = Get.arguments['meditationName'];
    getData();
    super.onInit();
  }
}
