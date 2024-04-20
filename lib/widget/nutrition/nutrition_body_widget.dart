import 'package:be_healthy/controller/nutrition_controller.dart';
import 'package:flutter/material.dart';

class NutritionBodyWidget extends StatelessWidget {
  const NutritionBodyWidget({
    super.key,
    required this.controller,
  });

  final NutritionController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: controller.data.length,
        padding: const EdgeInsets.all(0),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.goToPageNutritionDetails(controller.data[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "${controller.data[index].image}",
                      height: 170,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 18,
                    left: 0,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      width: MediaQuery.of(context).size.width * .47,
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "${controller.data[index].title}",
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
        });
  }
}