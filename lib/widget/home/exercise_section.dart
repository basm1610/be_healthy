import 'package:be_healthy/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ExerciseSection extends StatelessWidget {
  const ExerciseSection({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return GetBuilder<HomeController>(
        builder: (controller) => Row(
              children: [
                // InkWell(
                //   onTap: () {
                //     controller.goToWorkOutScreen();
                //   },
                //   child: const Card(
                //     color: Color(0xFFC05DDA),
                //     child: Padding(
                //       padding: EdgeInsets.symmetric(
                //           horizontal: 5, vertical: 25),
                //       child: Center(
                //           child: Text(
                //         "all\nexercise",
                //         style: TextStyle(color: Colors.white, fontSize: 10),
                //         textAlign: TextAlign.center,
                //       )),
                //     ),
                //   ),
                // ),

                Container(
                  // color: Colors.amber,
                  height: 100,
                  width: MediaQuery.of(context).size.width * .9,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.workOutModel.data?.length ?? 0,
                      itemBuilder: (context, index) => controller.isLoading
                          ? Center(
                              // heightFactor: 2.5,
                              child: Lottie.asset("assets/lotties/loading.json",
                                  width: 200, height: 200),
                            )
                          : InkWell(
                              onTap: () {
                                controller.goToWorkOutScreen();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "${controller.workOutModel.data?[index].image}",
                                    // controller.imagesGym[index],
                                    // height: 100,
                                    width: 100,
                                    // fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            )),
                ),
              ],
            ));
  }
}
