import 'package:be_healthy/controller/meditation_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pod_player/pod_player.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MeditationController controller = Get.put(MeditationController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          controller.name,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<MeditationController>(
          builder: (controller) => controller.isLoading
              ? Center(
                  // heightFactor: 2.5,
                  child: Lottie.asset("assets/lotties/loading.json",
                      width: 200, height: 200),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: PodVideoPlayer(
                        controller: PodPlayerController(
                            playVideoFrom: PlayVideoFrom.youtube(
                                "${controller.meditationModel.data?.link}"
                                // "https://youtu.be/9yY2h-l7esU?si=0PdclG27Aoo_Nvn8"
                                ),
                            podPlayerConfig: const PodPlayerConfig(
                              autoPlay: false,
                            ))
                          ..initialise(),
                        videoThumbnail: DecorationImage(
                          /// load from asset: AssetImage('asset_path')
                          image: NetworkImage(
                            '${controller.meditationModel.data?.image}'
                            // "${AppLink.imageTraining}/${controller.meditationModel.data?.image}"
                            ,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }
}
