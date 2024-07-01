import 'package:be_healthy/controller/nutrition/nutrition_details_controller.dart';
import 'package:be_healthy/widget/nutrition/appbart_nutrition_details.dart';
import 'package:be_healthy/widget/nutrition/nutrition_details_body_widget.dart';
import 'package:be_healthy/widget/offline_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NutritionDetailsScreen extends StatelessWidget {
  const NutritionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NutritionDetailsController controller =
        Get.put(NutritionDetailsController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const AppBarNutritionDetails(),
      ),
      body: Obx(
        () => controller.connectivityService.isConnected
            ? const NutritionDetailsBodyWidget()
            : const OfflineWidget(),
      ),
    );
  }
}
