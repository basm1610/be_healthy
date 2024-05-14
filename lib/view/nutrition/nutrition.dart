import 'package:be_healthy/controller/nutrition/nutrition_controller.dart';
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  controller.goToSearch();
                },
                icon: const Icon(
                  Icons.search,
                  size: 30,
                )),
          )
        ],
      ),
      body: GetBuilder<NutritionController>(
        builder: (controller) => const NutritionBodyWidget(),
      ),
    );
  }
}
