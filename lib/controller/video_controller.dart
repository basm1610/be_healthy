import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/video_data_model.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

class VideoController extends GetxController {
  late String id;
  Map isFavorite = {};
  late YoutubePlayerController youtubePlayerController;
  VideoDataModel videoDataModel = VideoDataModel();
  MyServices myServices = Get.find();
  Duration? duration;
  String? urlVideo = "https://youtu.be/jeLxN-wt7jY?si=-21CctevepV5sKc3";
  var videoId;
  bool isLoading = false;

  setFavorite(id, val) {
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
      body: jsonEncode({"trainingId" : itemId}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      Get.snackbar("Success", "${jsonResponse["message"]}");
      log("Data: $jsonResponse");
    }
  }

  getData() async {
    isLoading = true;
    update();
    final response = await http.get(Uri.parse("${AppLink.trainingDetails}$id"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      videoDataModel = VideoDataModel.fromJson(jsonResponse);
      // videoId = YoutubePlayer.convertUrlToId("${videoDataModel.data?.link}");
      // urlVideo = "${jsonResponse['data']['link']}";
      log("Data: $jsonResponse");
      log("Data: ${videoDataModel.data?.link}");
      log("URL is: $urlVideo");
    }
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    id = Get.arguments["id"];
    getData();

    super.onInit();
  }
}
