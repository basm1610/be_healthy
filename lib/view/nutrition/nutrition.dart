import 'package:be_healthy/controller/nutrition_controller.dart';
import 'package:be_healthy/widget/nutrition/nutrition_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NutritionController controller = Get.put(NutritionController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nutrition",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: NutritionBodyWidget(controller: controller),
    );
  }
}
