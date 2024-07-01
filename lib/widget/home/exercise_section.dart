import 'package:be_healthy/controller/home_controller.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ExerciseSection extends StatelessWidget {
  const ExerciseSection({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
        builder: (controller) => Row(
              children: [
                SizedBox(
                  height: 100.h,
                  width: MediaQuery.of(context).size.width * .91,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.workOutModel.data?.length ?? 0,
                      itemBuilder: (context, index) => 
                      InkWell(
                              onTap: () {
                                controller.goToWorkOutScreen();
                              },
                              child: Padding(
                                padding:
                                     EdgeInsets.symmetric(horizontal: 5.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: controller.isLoading? CircularProgressIndicator() :Image.network(
                                    "${controller.workOutModel.data?[index].image}"
                                    // "${AppLink.imageTraining}/${controller.workOutModel.data?[index].image}"
                                    ,
                                    // controller.imagesGym[index],
                                    // height: 100,
                                    width: 150.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )),
                ),
              ],
            ));
  }
}
