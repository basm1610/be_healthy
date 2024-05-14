import 'package:be_healthy/widget/nutrition/appbart_nutrition_details.dart';
import 'package:be_healthy/widget/nutrition/nutrition_details_body_widget.dart';
import 'package:flutter/material.dart';

class NutritionDetailsScreen extends StatelessWidget {
  const NutritionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const AppBarNutritionDetails(),
        
       
      ),
      body: const NutritionDetailsBodyWidget(),
    );
  }
}
