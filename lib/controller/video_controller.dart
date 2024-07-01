import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/video_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VideoController extends GetxController {
  late String id;
  late String name;
  Map isFavorite = {};
  VideoDataModel videoDataModel = VideoDataModel();
  MyServices myServices = Get.find();
  Duration? duration;
  var videoId;
  bool isLoading = false;
  bool isFav = false;

  setFavorite(String id, String val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(var itemId) async {
    final response = await http.post(
      Uri.parse(AppLink.addFavorite),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${myServices.sharedPreferences.getString("token")}',
      },
      body: jsonEncode({"trainingId": itemId}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      Get.snackbar("Success", "${jsonResponse["message"]}");
      log("Data: $jsonResponse");
    }

    update();
  }

  deleteFavorite(var itemId) async {
    final response = await http.delete(
      Uri.parse(AppLink.deleteFavourite),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${myServices.sharedPreferences.getString("token")}',
      },
      body: jsonEncode({"trainingId": itemId}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      Get.snackbar("Success", "${jsonResponse["message"]}");
      log("Data: $jsonResponse");
    }
    update();
  }

  getData() async {
    isLoading = true;
    update();
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
      videoDataModel = VideoDataModel.fromJson(jsonResponse);
      // videoId = YoutubePlayer.convertUrlToId("${videoDataModel.data?.link}");
      // urlVideo = "${jsonResponse['data']['link']}";
      //  isFavorite[videoDataModel.data?.sId ?? ''] = jsonResponse['isFavorite'] ?? '0';
      log("Data: $jsonResponse");
      log("Data: ${videoDataModel.data?.link}");
    }
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    id = Get.arguments["id"];
    name = Get.arguments["name"];
    getData();

    super.onInit();
  }
}
