import 'package:be_healthy/controller/workout_controller.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/data/static/static.dart';
import 'package:be_healthy/widget/offline_widget.dart';
import 'package:be_healthy/widget/workout/section_favourite.dart';
import 'package:be_healthy/widget/workout/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';

class WorkOutScreen extends StatelessWidget {
  const WorkOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WorkoutController controller = Get.put(WorkoutController());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Workouts".tr,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSecondary),
          ),
          automaticallyImplyLeading: false,
        ),
        body:
            // Obx(() =>
            //  controller.connectivityService.isConnected
            //     ?
            SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .35,
                  child: GridView.builder(
                      itemCount: cardWorkoutList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.29,
                      ),
                      itemBuilder: (context, index) {
                        return GetBuilder<WorkoutController>(builder: (controller)=>WorkOutCard(
                          assetName: "${cardWorkoutList[index].image}",
                          title: "${cardWorkoutList[index].title}".tr,
                          color: cardWorkoutList[index].color,
                          onTap: () {
                            controller.goToPageStrength(
                                "${cardWorkoutList[index].title}".tr);
                          },
                        ));
                      }),
                ),
                // const Text(
                //   "Popular",
                //   style: TextStyle(
                //       fontSize: 20, fontWeight: FontWeight.w600),
                // ),
                // const SectionFavourite(),
                Text(
                  "Meditation".tr,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                GetBuilder<WorkoutController>(
                    builder: (controller) => SizedBox(
                          height: MediaQuery.of(context).size.height * .375,
                          child: ListView.builder(
                              // shrinkWrap: true,
                              itemCount:
                                  controller.meditationModel.data?.length ?? 0,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.goToPageMeditation(
                                            "${controller.meditationModel.data?[index].sId}",
                                            "${controller.meditationModel.data?[index].name}");
                                      },
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            "${controller.meditationModel.data?[index].image}"
                                            // "${AppLink.imageTraining}/${controller.meditationModel.data?[index].image}"

                                            ,
                                          )),
                                    ),
                                  )),
                        )),

                // videoThumbnail: DecorationImage(
                //   /// load from asset: AssetImage('asset_path')
                //   image: NetworkImage(
                //     '${controller.videoDataModel.data?.image}',
                //   ),
                //   fit: BoxFit.cover,
                // ),
              ],
            ),
          ),
        )
        // : const OfflineWidget(),

        // ),
        );
  }
}
