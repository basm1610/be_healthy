import 'package:be_healthy/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NutritionSection extends GetView<HomeController> {
  const NutritionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: GetBuilder<HomeController>(
        builder: (controller) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.foodCategoryModel.data?.length ?? 0,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              controller.goToNutritionScreen();
            },
            child: SizedBox(
              width: 150,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.transparent,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "${controller.foodCategoryModel.data?[index].image}",
                            width: 200,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${controller.foodCategoryModel.data?[index].name}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1F2937)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
