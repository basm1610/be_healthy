import 'package:be_healthy/controller/nutrition/nutrition_details_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NutritionDetailsBodyWidget extends StatelessWidget {
  const NutritionDetailsBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(NutritionDetailsController());
    return GetBuilder<NutritionDetailsController>(
        builder: (controller) => ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: controller.foodAllCategoryModel.data?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "${controller.foodAllCategoryModel.data![index].name}",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    "calories per 1 cup",
                    style: TextStyle(color: Color(0XFF746F6F), fontSize: 15),
                  ),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.add,
                      size: 40,
                      color: Color(0xff8B529A),
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                          title: "Attention!",
                          cancelTextColor: AppColor.primaryColor,
                          confirmTextColor: Colors.white,
                          buttonColor: AppColor.primaryColor,
                          middleText:
                              "Are you sure you want to eat\n${controller.foodAllCategoryModel.data?[index].name}?",
                          onCancel: () {
                            print("cancel");
                          },
                          onConfirm: () {
                            print("confirm");
                            controller.sendPostRequest(
                                "${controller.foodAllCategoryModel.data![index].calorie}");
                            Get.back();
                            Get.snackbar(
                                snackPosition: SnackPosition.BOTTOM,
                                "Nutrition",
                                "The ${controller.foodAllCategoryModel.data![index].calorie} was added successfully");
                          });
                    },
                  ),
                  trailing: Container(
                    width: 65,
                    height: 60,
                    color: AppColor.primaryColor,
                    child: Center(
                      child: Text(
                        "${controller.foodAllCategoryModel.data![index].calorie}",
                        style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ));
  }
}
