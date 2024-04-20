import 'package:be_healthy/model/nutrition_model.dart';
import 'package:flutter/material.dart';

class AppBarNutritionDetails extends StatelessWidget {
  const AppBarNutritionDetails({
    super.key,
    required this.nutritionModel,
  });

  final NutritionModel nutritionModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${nutritionModel.title}',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30,
          backgroundImage: AssetImage("${nutritionModel.image}"),
        )
      ],
    );
  }
}