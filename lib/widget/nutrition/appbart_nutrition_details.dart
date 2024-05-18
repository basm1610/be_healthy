import 'package:be_healthy/controller/nutrition/nutrition_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarNutritionDetails extends StatelessWidget {
  const AppBarNutritionDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(NutritionDetailsController());
    return GetBuilder<NutritionDetailsController>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // "",
                  controller.name,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 30,
                  backgroundImage: NetworkImage(
                      controller.image),
                )
              ],
            ));
  }
}
