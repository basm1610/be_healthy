import 'package:be_healthy/controller/nutrition_details_controller.dart';
import 'package:be_healthy/model/nutrition_model.dart';
import 'package:be_healthy/widget/nutrition/appbart_nutrition_details.dart';
import 'package:be_healthy/widget/nutrition/nutrition_details_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NutritionDetailsScreen extends StatelessWidget {
  final NutritionModel nutritionModel;
  const NutritionDetailsScreen({super.key, required this.nutritionModel});

  @override
  Widget build(BuildContext context) {
    NutritionDetailsController controller =
        Get.put(NutritionDetailsController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: AppBarNutritionDetails(nutritionModel: nutritionModel),
      ),
      body: NutritionDetailsBodyWidget(controller: controller),
    );
  }
}
