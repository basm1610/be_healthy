import 'package:be_healthy/controller/workout_controller.dart';
import 'package:be_healthy/data/static/static.dart';
import 'package:be_healthy/widget/workout/section_favourite.dart';
import 'package:be_healthy/widget/workout/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkOutScreen extends StatelessWidget {
  const WorkOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WorkoutController controller = Get.put(WorkoutController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "WorkOut",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
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
                      childAspectRatio: 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return WorkOutCard(
                        assetName: "${cardWorkoutList[index].image}",
                        title: "${cardWorkoutList[index].title}",
                        color: cardWorkoutList[index].color,
                        onTap: () {
                          controller.goToPageStrength(
                              "${cardWorkoutList[index].title}");
                        },
                      );
                    }),
              ),
              // Row(
              //   children: [
              //     WorkOutCard(
              //         color: const Color(0xffC669DE),
              //         assetName: 'assets/images/strength1.png',
              //         title: 'Strength',
              //         onTap: () {
              //           controller.goToPageStrength();
              //         }),
              //     WorkOutCard(
              //       assetName: "assets/images/stretching.png",
              //       title: "Stretching",
              //       color: const Color(0xff8EE97F),
              //       onTap: () {},
              //     )
              //   ],
              // ),
              // const SizedBox(height: 10),
              // const Row(
              //   children: [
              //     WorkOutCard(
              //         assetName: "assets/images/cardio1.png",
              //         title: "Cardio",
              //         color: Color(0xff696EF2)),
              //     WorkOutCard(
              //         assetName: "assets/images/zomba.png",
              //         title: "Zomba",
              //         color: Color(0xffECFF75))
              //   ],
              // ),

              const Text(
                "Popular",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SectionFavourite(),
              // SizedBox(
              //   height: 50,
              // )
              // const Text(
              //   "Pouplar",
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              // ),
              // const SectionPopular()
            ],
          ),
        ),
      ),
    );
  }
}
