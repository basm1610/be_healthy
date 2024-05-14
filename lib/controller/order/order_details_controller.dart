import 'dart:convert';
import 'dart:developer';

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
  late int rateFromUser;
  RestaurantModel restaurantModel = RestaurantModel();
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
    // var response = await http.post(Uri.parse(AppLink.createReview),
    //     headers: {
    //       'Content-Type': 'application/json',
    //       'Accept': 'application/json',
    //       'Authorization':
    //           'Bearer ${myServices.sharedPreferences.getString("token")}',
    //     },
    //     body: jsonEncode({
    //       "ratings": "$rateFromUser",
    //       "restaurant": id,
    //     }));
    // var jsonResponse = jsonDecode(response.body);
    // if (response.statusCode == 201 || response.statusCode == 200) {
    //   log("success");
    //   log("response === ${response.body}");
    //   Get.snackbar(
    //     snackPosition: SnackPosition.BOTTOM,
    //     "attention",
    //     "Sucess To Add Review !",
    //     duration: const Duration(seconds: 2),
    //     icon: const Icon(
    //       Icons.done_all_outlined,
    //       size: 35,
    //     ),
    //   );
    // } else if (jsonResponse['status'] == "fail") {
    //   log("${jsonResponse['status']}");
    //   log("${jsonResponse['message']}");
    //   Get.snackbar(
    //     snackPosition: SnackPosition.BOTTOM,
    //     "attention",
    //     "${jsonResponse['message']}",
    //     duration: const Duration(seconds: 2),
    //     icon: const Icon(
    //       Icons.error_rounded,
    //       size: 35,
    //     ),
    //   );
    // } else {
    //   log("${response.statusCode}");
    //   log("fiald");
    // }
    update();
    // log("index is : $index");
    // log("index is : $rateFromUser");
  }

  void ratting(rate) {
    rating = rate;
    update();
  }

  getData() async {
    isLoading = true;
    update();
    final response =
        await http.get(Uri.parse("${AppLink.restaurantDetails}$id"));
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      restaurantModel = RestaurantModel.fromJson(jsonResponse);
      rating = restaurantModel.data!.rate;
      url = Uri.parse("${jsonResponse['data']['link']}");
      log("Data: ${jsonResponse["data"]}");
    }
    isLoading = false;
    update();
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
  void onInit() {
    id = Get.arguments["id"];
    log("id from resturant is: $id");
    getData();
    super.onInit();
  }
}
