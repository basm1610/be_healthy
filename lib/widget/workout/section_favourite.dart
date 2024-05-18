import 'package:be_healthy/controller/workout_controller.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionFavourite extends StatelessWidget {
  const SectionFavourite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 290,
      // width: 250,
      child: GetBuilder<WorkoutController>(
          builder: (controller) => ListView.builder(
              // padEnds: false,
              itemCount: controller.popularModel.data?.length ?? 0,
              // pageSnapping: true,
              // controller: controller.pageController,
              // onPageChanged: (page) {
              //   // setState(() {
              //   //   activePage = page;
              //   // });
              // },
              itemBuilder: (context, pagePosition) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Stack(
                    children: [
                      Container(
                        // color: Colors.amber,
                        margin: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "${AppLink.imageTraining}/${controller.popularModel.data?[pagePosition].image}",
                            fit: BoxFit.cover,
                            // width: 300,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          width: MediaQuery.of(context).size.width * .917,
                          decoration: BoxDecoration(
                              color: Colors.black38.withOpacity(.5),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: Text(
                            "${controller.popularModel.data![pagePosition].name}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: (const TextStyle(
                                fontWeight: FontWeight.w700,
                                // backgroundColor: Colors.black38
                                color: Colors.white)),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })),
    );
  }
}
