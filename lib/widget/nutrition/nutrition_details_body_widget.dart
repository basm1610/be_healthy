import 'package:be_healthy/controller/nutrition/nutrition_details_controller.dart';
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
        builder: (controller) => controller.isLoading
            ? Center(
                heightFactor: 2.5,
                child: Lottie.asset("assets/lotties/loading.json",
                    width: 200, height: 200),
              )
            : ListView.separated(
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
                        controller.sendPostRequest(
                            "${controller.foodAllCategoryModel.data![index].calorie}");
                        Get.snackbar(
                            snackPosition: SnackPosition.BOTTOM,
                            "Nutrition",
                            "The ${controller.foodAllCategoryModel.data![index].calorie} was added successfully");
                      },
                    ),
                    trailing: Container(
                      width: 65,
                      height: 60,
                      color: const Color(0xff61B953),
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
