// import 'dart:developer';
// import 'package:be_healthy/model/test_model.dart';
// import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:pod_player/pod_player.dart';
// import 'dart:convert';

// class TestController extends GetxController {
//   bool isLoading = false;
//   TestModel testModel = TestModel();
//   List<TestModel> listData = [];
//   final urlVideo = "https://youtu.be/WIHy-ZnSndA?si=3sIi-mZjJ7V3nj0k";
//   var timer;
//   Duration? duration;
//     bool isInitialized = false;

//   // static Map<String, dynamic> data = {};
//   // late VideoPlayerController controllerVideo;
//   // late ChewieController chewieController;
//   // late YoutubePlayerController youtubePlayerController;
//   var list = "";
//   var videoId;
//    PodPlayerController? podPlayerController;

//   void loading() {
//     Get.defaultDialog(content: const Center(child: CircularProgressIndicator()));
//     Future.delayed(const Duration(seconds: 1));
//     Get.back();

//     // setLoading(false);
//   }

//   // Future<void> intiliztionPlayer() async {
//   //   controllerVideo = VideoPlayerController.networkUrl(Uri.parse(
//   //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));

//   //   await Future.wait([controllerVideo.initialize()]);
//   // }

// //   getData() async {
// //     final response = await http.get(Uri.parse(AppLink.categoryFood));
// // /*jsonDecode is a Dart function provided by dart:convert library used
// //  to convert JSON data,
// //  received from an API or read from a file, into Dart objects.
// //  It transforms JSON strings into Dart maps or lists*/

// //     if (response.statusCode == 200 || response.statusCode == 201) {
// //       var jsonResponse = jsonDecode(response.body);
// //       // response.data
// //       // foodCategoryModel = FoodCategoryModel.fromJson(jsonResponse);
// //       // dataFood.addAll(jsonResponse['data']);
// //       // testModel = TestModel.fromJson(jsonResponse);
// //       List<dynamic> data = jsonResponse['data'];

// //       for (var element in data) {
// //         TestModel testModel = TestModel(
// //           id: element['_id'],
// //           name: element['name'],
// //           image: element['image'],
// //         );
// //         listData.add(testModel);
// //         log(element["name"]);
// //         log(listData.toString());
// //       }
// //       // dataFood.addAll(jsonResponse['data']); //////////////////////
// //       // log("${data['name']}");
// //       // print(data['name']);
// //       // log("Data Model: ${foodCategoryModel.name}");
// //     }
// //     update();
// //   }
//   // getVideoPosition() {
//   //   var duration = Duration(
//   //       milliseconds: controllerVideo.value.position.inMilliseconds.round());
//   //   return [duration.inMinutes, duration.inSeconds]
//   //       .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
//   //       .join(':');
//   // }

//   getData() async {
//     final response = await http.get(Uri.parse(
//         "http://192.168.1.7:3000/api/v1/training/663e756081819a451a0cd350"));
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       var jsonResponse = jsonDecode(response.body);
//       // videoDataModel = VideoDataModel.fromJson(jsonResponse);
//       // videoId = YoutubePlayer.convertUrlToId("${videoDataModel.data?.link}");
//       // urlVideo = "${jsonResponse['data']['link']}";
//       list = await jsonResponse['data']['link'];

//       // Future.delayed(Duration(microseconds: 1000));
//       // videoId = YoutubePlayer.convertUrlToId(list.value);
//       // PodPlayerController(playVideoFrom: PlayVideoFrom.youtube(list))
//       //     .initialise().then((value) => isInitialized = true);
//       //  youtubePlayerController =await  YoutubePlayerController(
//       // initialVideoId: videoId!,
//       // flags: YoutubePlayerFlags(
//       //   captionLanguage: 'ar',
//       //   autoPlay: false,
//       // ));
//       log("Data is : ${list}");
//       log("videoId : ${videoId}");
//       // return data['data']['link'];
//       // log("Data: $jsonResponse");
//       // log("Data: ${videoDataModel.data?.link}");
//       // log("URL is: $urlVideo");
//     }
//       // log("tiem: ${podPlayerController?.videoPlayerValue!.duration}");

//     update();
//   }

//   @override
//   void onInit() {
//     getData();
//     if (videoId == null) {
//       // getData();
//       Future.delayed(Duration(milliseconds: 1000));
//       log("videoId : ${videoId}");
//     }

//     //  log("videoId : ${videoId}");
//     // Future.delayed(Duration(milliseconds: 1000));

//     // log("videoId: $videoId");
//     // youtubePlayerController =  YoutubePlayerController(
//     //     initialVideoId: videoId!,
//     //     flags: YoutubePlayerFlags(
//     //       captionLanguage: 'ar',
//     //       autoPlay: false,
//     //     ));
//     // // duration = youtubePlayerController.value.position;
//     // youtubePlayerController.addListener(() {
//     //   update();
//     // });

//     // log("timerrrrrr:${}");

//     // intiliztionPlayer();
//     // getData();
//     // TODO: implement onInit
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     // controllerVideo.dispose();
//     // chewieController.dispose();
//     super.dispose();
//   }
// }
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkService extends GetxService {
  final InternetConnectionChecker _checker = InternetConnectionChecker();
  final RxBool isConnected = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checker.onStatusChange.listen((status) {
      isConnected.value = status == InternetConnectionStatus.connected;
    });
  }

  Future<bool> get connectionStatus async {
    return await _checker.hasConnection;
  }
}

// class CheckInternetController extends GetxController {
//   List<ConnectivityResult> connectionStatus = [ConnectivityResult.none];
//   final Connectivity connectivity = Connectivity();
//   late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initConnectivity() async {
//     late List<ConnectivityResult> result;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       result = await connectivity.checkConnectivity();
//       update();
//     } on PlatformException catch (e) {
//       log('Couldn\'t check connectivity status', error: e);
//       return;
//     }
   
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     update();
//     return _updateConnectionStatus(result);
//   }

//   Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
//     connectionStatus = result;
//      if (connectionStatus.contains(ConnectivityResult.wifi)) {
//       log("wifi");
//     } else if (connectionStatus.contains(ConnectivityResult.none)) {
//       log("none");
//     }
//     update();
//     // ignore: avoid_print
//     print('Connectivity changed: $connectionStatus');
//   }

//   @override
//   void onInit() {
//     // log("${connectionStatus[0]}");
//     initConnectivity();
//     connectivitySubscription =
//         connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//     update();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     connectivitySubscription.cancel();
//     super.dispose();
//   }
// }

class ConnectivityService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  final _isConnected = false.obs;

  bool get isConnected => _isConnected.value;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _checkInternetConnection();
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    _isConnected.value = await InternetConnectionChecker().hasConnection;
  }
}
