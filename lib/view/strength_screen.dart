import 'dart:developer';

import 'package:be_healthy/controller/strength_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class StrengthScreen extends StatelessWidget {
  const StrengthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StrengthController controller = Get.put(StrengthController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
              if (index == 0) {
                controller.level = "beginner";
              } else {
                controller.level = "advanced";
              }
              log("index is: $index");
              controller.getData();
              controller.update();
            },
            // padding: EdgeInsets.zero,
            // isScrollable: true1
            // indicatorWeight: 50,
            labelColor: Colors.black,

            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),

            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5), // Creates border
                color: AppColor.fourthColor),
            tabs: const [
              Tab(text: "beginner"),
              Tab(text: "advanced"),
            ],
          ),
          title: const Text(
            "Strength training",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<StrengthController>(
            builder: (controller) => TabBarView(
                  children: [
                    controller.isLoading
                        ? Center(
                            // heightFactor: 2.5,
                            child: Lottie.asset("assets/lotties/loading.json",
                                width: 200, height: 200),
                          )
                        : 
                        const CustomTabBarItem(),

                    controller.isLoading
                        ? Center(
                            // heightFactor: 2.5,
                            child: Lottie.asset("assets/lotties/loading.json",
                                width: 200, height: 200),
                          )
                        : const CustomTabBarItem()
                  ],
                )
                ),
      ),
    );
  }
}

class CustomTabBarItem extends GetView<StrengthController> {
  const CustomTabBarItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Full Body Training",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height:
                  MediaQuery.of(context).size.height * .75,
              child: ListView.builder(
                  itemCount: controller
                          .workOutModel.data?.length ??
                      0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 10),
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.goToScreenVideo(
                                  "${controller.workOutModel.data![index].sId}");
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  right: 10),
                              child: Image.network(
                                "${controller.workOutModel.data![index].image}",
                                fit: BoxFit.cover,
                                // width: ,
                                // width: double.maxFinite,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5),
                              width: MediaQuery.of(context)
                                      .size
                                      .width *
                                  .93,
                              decoration: BoxDecoration(
                                  color: Colors.black45
                                      .withOpacity(.3),
                                  borderRadius:
                                      BorderRadius.circular(
                                          5)),
                              child: Text(
                                "${controller.workOutModel.data![index].name}",
                                maxLines: 1,
                                style: (const TextStyle(
                                    fontWeight:
                                        FontWeight.w700,
                                    // backgroundColor: Colors.black38
                                    color: Colors.white)),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      );
  }
}
