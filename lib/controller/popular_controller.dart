import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/popular_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PopularController extends GetxController {
  bool isLoading = false;
  MyServices myServices = Get.find();
  PopularModel popularModel = PopularModel();

  getDataPopular() async {
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
    getDataPopular();
    super.onInit();
  }
}
