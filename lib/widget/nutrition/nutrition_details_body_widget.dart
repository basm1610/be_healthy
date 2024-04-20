import 'package:be_healthy/controller/nutrition_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NutritionDetailsBodyWidget extends StatelessWidget {
  const NutritionDetailsBodyWidget({
    super.key,
    required this.controller,
  });

  final NutritionDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: controller.title.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            controller.title[index],
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
              Get.snackbar(
                  snackPosition: SnackPosition.BOTTOM,
                  "Nutrition",
                  "The ${controller.title[index]} was added successfully");
            },
          ),
          trailing: Container(
            width: 65,
            height: 60,
            color: const Color(0xff61B953),
            child: Center(
              child: Text(
                controller.number[index],
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
