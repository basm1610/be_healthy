import 'package:be_healthy/model/order_meal_model.dart';
import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.orderMealModel,
  });

  final OrderMealModel orderMealModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          "${orderMealModel.image}",
        ),
      ),
    );
  }
}