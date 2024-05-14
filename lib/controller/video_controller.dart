import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/model/video_data_model.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

class VideoController extends GetxController {
  late String id;
  late YoutubePlayerController youtubePlayerController;
  VideoDataModel videoDataModel = VideoDataModel();
  Duration? duration;
  String? urlVideo = "https://youtu.be/jeLxN-wt7jY?si=-21CctevepV5sKc3";
  var videoId;
  bool isLoading = false;

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
