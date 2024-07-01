// import 'dart:developer';

// import 'package:be_healthy/controller/auth/signup_controller.dart';
// import 'package:be_healthy/controller/test/test_controller.dart';
// import 'package:be_healthy/widget/login/custom_button.dart';
// import 'package:chewie/chewie.dart';
import 'dart:developer';

import 'package:be_healthy/controller/theme_controller.dart';
import 'package:be_healthy/core/localization/change_lang.dart';
import 'package:be_healthy/widget/login/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pod_player/pod_player.dart';
// import 'package:video_player/video_player.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class TestScreen extends StatelessWidget {
//   const TestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TestController controller = Get.put(TestController());
//     return Scaffold(
//         // appBar: AppBar(

//         //   surfaceTintColor: Colors.transparent,
//         //   actions: [
//         //     Padding(
//         //       padding: const EdgeInsets.symmetric(horizontal: 10),
//         //       child: Icon(
//         //         Icons.favorite_border,
//         //         size: 35,
//         //       ),
//         //     ),
//         //   ],
//         // ),

//         // floatingActionButton: FloatingActionButton(
//         //   onPressed: () {
//         //     controller.controllerVideo.value.isPlaying
//         //         ? controller.controllerVideo.pause()
//         //         : controller.controllerVideo.play();
//         //   },
//         //   child: Icon(
//         //     controller.controllerVideo.value.isPlaying
//         //         ? Icons.pause
//         //         : Icons.play_arrow,
//         //   ),
//         // ),
//         body: SafeArea(
//       child: GetBuilder<TestController>(
//         builder: (context) =>
//             // Container()
//             // controller.list.value.isNotEmpty?
//             // // YoutubePlayer(
//             // //         controller: YoutubePlayerController(
//             // //           initialVideoId: YoutubePlayer.convertUrlToId(controller.list.value)!,
//             // //           flags: YoutubePlayerFlags(autoPlay: true),
//             // //         ),
//             // //         showVideoProgressIndicator: true,
//             // //       )
//             // PodVideoPlayer(controller: PodPlayerController(playVideoFrom: PlayVideoFrom.youtube(controller.list.value))..initialise())
//             //       :Center(child: CircularProgressIndicator())
//             // YoutubePlayerBuilder(
//             //     player: YoutubePlayer(
//             //         controller: controller.youtubePlayerController),
//             //     builder: (context, player) {
//             //       return Column(
//             //         children: [
//             //           // some widgets
//             //           player,
//             //           //some other widgets
//             //         ],
//             //       );
//             //     })
//             // Column(
//             //                 children: [
//             //                   YoutubePlayer(
//             //                     onEnded: (value) {
//             //                       Duration videoDuration = controller.youtubePlayerController.value.position;
//             // print('Video duration: ${videoDuration.inMinutes}');
//             //                     },
//             //                     controller: controller.youtubePlayerController,
//             //                     showVideoProgressIndicator: true,
//             //                     progressIndicatorColor: Colors.amber,
//             //                     progressColors: const ProgressBarColors(
//             //                       playedColor: Colors.amber,
//             //                       handleColor: Colors.amberAccent,
//             //                     ),
//             //                     onReady: () {
//             //                       Duration currentPosition =
//             //                           controller.youtubePlayerController.value.position;
//             //                       // log('Current position: ${currentPosition}');
//             //                     },
//             //                   ),
//             //                   Text(
//             //                       "${controller.youtubePlayerController.value.position}")
//             //                 ],
//             //               )

//             Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Toned arms",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               controller.list.isNotEmpty
//                   ?
//                   // YoutubePlayer(
//                   //         controller: YoutubePlayerController(
//                   //           initialVideoId: YoutubePlayer.convertUrlToId(controller.list.value)!,
//                   //           flags: YoutubePlayerFlags(autoPlay: true),
//                   //         ),
//                   //         showVideoProgressIndicator: true,
//                   //       )
//                   PodVideoPlayer(
//                       controller: PodPlayerController(
//                           playVideoFrom:
//                               PlayVideoFrom.youtube(controller.list),
//                           podPlayerConfig: PodPlayerConfig(autoPlay: false))
//                         ..initialise()
//                             .then((value) => controller.isInitialized = true),
//                     )
//                   : Center(child: CircularProgressIndicator()),
//               SizedBox(
//                 height: 15,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.watch_later_outlined,
//                         size: 20,
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         // "${PodPlayerController(playVideoFrom: PlayVideoFrom.youtube(controller.list.value)).videoPlayerValue?.duration}"
//                         //     .substring(2, 7),
//                         "55",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.fireplace_sharp,
//                         size: 20,
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "260",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       Text(" calories")
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.fitness_center_rounded,
//                         size: 20,
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "middle",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Text(
//                 "How to do arnold press",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                   "Get on all fours with your arms straight and your hands placed slightly wider than your shoulders. Keep your legs in line with your back. \nBend your elbows to lower yourself toward the ground. Stop when your elbows are at 90-degree angles.\nStraighten your arms to push yourself back up into your starting position to complete a rep ​Complete as many reps as you can while maintaining proper form to add push-ups to your workout routine")
//             ],
//           ),
//         ),

//         // Padding(
//         //           padding: const EdgeInsets.all(10.0),
//         //           child:
//         //           ListView.builder(
//         //               itemCount: controller.listData.length,
//         //               itemBuilder: (context, index) {
//         //                 return Card(
//         //                   surfaceTintColor: Colors.transparent,
//         //                   elevation: 8,
//         //                   child: ListTile(
//         //                     contentPadding: EdgeInsets.all(20),
//         //                     title: Text(
//         //                       "${controller.listData[index].name}",
//         //                       style: GoogleFonts.inter(
//         //                           fontSize: 16, fontWeight: FontWeight.w700),
//         //                     ),
//         //                     leading: CircleAvatar(
//         //                         radius: 35,
//         //                         child: Image.asset(
//         //                           "assets/images/image2.png",
//         //                           // fit: BoxFit.contain,
//         //                           // width: 150,
//         //                           // height: 150,
//         //                         )),
//         //                   ),
//         //                 );
//         //               })
//         //           ,
//         //         )
//       ),
//     ));
//   }
// }

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    LocaleController localeController = Get.put(LocaleController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('1'.tr),
      ),
      body: GetBuilder<ThemeController>(
          builder: (controller) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '2'.tr,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text("3".tr),
                    // Switch(
                    //   value: themeController.isDarkMode.value,
                    //   onChanged: (value) {
                    //     themeController.toggleTheme();
                    //   },
                    // ),
                    Text(
                        "${themeController.foodCategoryModel.data?[1].name}"),
                    Transform.scale(
                        scale: .9,
                        child: CupertinoSwitch(
                          value: themeController.isDarkMode.value,
                          onChanged: (val) {
                            themeController.toggleTheme();
                          },
                          trackColor: Color(0xffEBE3DE),
                          activeColor: Color(0xff362C26),
                        )),
                   
                    CustomButton(
                      text: "ar",
                      onPressed: () {
                        localeController.changeLange("ar");
                        log("lang is: ${localeController.myServices.sharedPreferences.getString("lang")}");
                        // themeController.getData();
                      },
                    ),
                    CustomButton(
                      text: "en",
                      onPressed: () {
                        localeController.changeLange("en");
                        log("lang is: ${localeController.myServices.sharedPreferences.getString("lang")}");
                        // themeController.getData();
                      },
                    ),
                  ],
                ),
              )),
    );
  }
}
