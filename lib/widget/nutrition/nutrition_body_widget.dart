
import 'package:be_healthy/controller/nutrition/nutrition_controller.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NutritionBodyWidget extends StatelessWidget {
  const NutritionBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // NutritionController controller = Get.put(NutritionController());
    return GetBuilder<NutritionController>(
        builder: (controller) => GridView.builder(
            itemCount: controller.foodCategoryModel.data?.length ?? 0,
            padding: const EdgeInsets.all(0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.goToFoodDetails(
                      "${controller.foodCategoryModel.data![index].name}",
                      "${controller.foodCategoryModel.data![index].sId}",
                      "${controller.foodCategoryModel.data![index].image}");
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          // "assets/images/1.png",
                          "${controller.foodCategoryModel.data![index].image}",
                          // "${controller.foodCategoryModel.data![index].name}"
                          height: 170,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          width: MediaQuery.of(context).size.width * .473,
                          decoration: const BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              )),
                          child: Text(
                            "${controller.foodCategoryModel.data![index].name}"
                                .capitalize!,
                            textAlign: TextAlign.center,
                            style: (const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
