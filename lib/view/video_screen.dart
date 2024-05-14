import 'package:be_healthy/controller/video_controller.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pod_player/pod_player.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VideoController controller = Get.put(VideoController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.favorite_border,
              size: 25,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: GetBuilder<VideoController>(
          builder: (context) => controller.isLoading
              ? Center(
                  // heightFactor: 2.5,
                  child: Lottie.asset("assets/lotties/loading.json",
                      width: 200, height: 200),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Text(
                        "${controller.videoDataModel.data?.name}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: PodVideoPlayer(
                          controller: PodPlayerController(
                              playVideoFrom: PlayVideoFrom.youtube(
                                  "${controller.videoDataModel.data?.link}"),
                              podPlayerConfig: const PodPlayerConfig(
                                autoPlay: false,
                              ))
                            ..initialise(),
                          videoThumbnail: DecorationImage(
                            /// load from asset: AssetImage('asset_path')
                            image: NetworkImage(
                              '${controller.videoDataModel.data?.image}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                // "${PodPlayerController(playVideoFrom: PlayVideoFrom.youtube(controller.list.value)).videoPlayerValue?.duration}"
                                //     .substring(2, 7),
                                "55",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.fireplace_sharp,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "260",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(" calories")
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.fitness_center_rounded,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${controller.videoDataModel.data?.level}",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        "How to do arnold press",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("${controller.videoDataModel.data?.description}")
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
