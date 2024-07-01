import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/controller/test/test_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class OrderDetailsController extends GetxController {
  double rating = 0.0;
  int isSelected = -1;
  bool isLoading = false;
  late String id;
  late String name;
  late int rateFromUser;
  RestaurantModel restaurantModel = RestaurantModel();
  NetworkService networkService = Get.put(NetworkService());
  

  MyServices myServices = Get.find();
  late Uri url;

  List<String> title = [
    "bad",
    "good",
    "very good",
    "amazing",
  ];
  List<IconData> iconFace = [
    FontAwesomeIcons.faceFrown,
    FontAwesomeIcons.faceSmileBeam,
    FontAwesomeIcons.faceGrin,
    FontAwesomeIcons.faceDizzy,
  ];

  selectedItems(int index) async {
    isSelected = index;
    if (index == 0) {
      rateFromUser = 1;
    } else if (index == 1) {
      rateFromUser = 2;
    } else if (index == 2) {
      rateFromUser = 3;
    } else {
      rateFromUser = 4;
    }
  }

  void ratting(rate) {
    rating = rate;
    update();
  }

  getData() async {
    // if (!networkService.isConnected.value) {
      isLoading = true;
      update();
      final response =
          await http.get(Uri.parse("${AppLink.restaurantDetails}$id"),headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'lang': '${myServices.sharedPreferences.getString("lang")}',
        },);
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        restaurantModel = RestaurantModel.fromJson(jsonResponse);                 
        rating = restaurantModel.data!.rate;
        url = Uri.parse("${jsonResponse['data']['link']}");
        log("Data: ${jsonResponse["data"]}");
      }
      isLoading = false;
      update();
    // } else {
    //   log("not connected");
    // }
  }

  Future<void> goLaunchUrl() async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  showAlert() {
    Get.snackbar("Be Healthy",
        '"BEHEALTHY" is the code for 10% discound from ${restaurantModel.data?.name}',
        snackPosition: SnackPosition.TOP,
        barBlur: 5,
        backgroundColor: AppColor.grey4,
        icon: Icon(FontAwesomeIcons.skullCrossbones));
  }

  @override
  void onInit() async{
    id = Get.arguments["id"];
    name = Get.arguments["name"];
    log("id from resturant is: $id");
    super.onInit();
   await getData();
  }
}
