import 'dart:developer';

import 'package:be_healthy/controller/calories/calories_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/widget/calories/card_calories.dart';
import 'package:be_healthy/widget/calories/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CaloriesScreen extends StatelessWidget {
  const CaloriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CaloriesController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          "My Calories",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GetBuilder<CaloriesController>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: controller.isLoading
                ? Center(
                    heightFactor: 2.5,
                    child: Lottie.asset("assets/lotties/loading.json",
                        width: 200, height: 200),
                  )
                : Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        " Plan",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CardCalories(
                        caloriesChange: controller.data,
                        totalCalories:
                            "${controller.getDataModel.data?.caloriesNeeded}",
                        percent: controller.percentCalories,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const CardWidget(
                        isWater: false,
                        angle: 270 * 3.141592653589793 / 180,
                        title: "Steps",
                        number: '1,400',
                        icon: FontAwesomeIcons.shoePrints,
                        description: "goal 10,000 steps",
                        color: Color(0xffF589D7),
                        percent: .4,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CardWidget(
                        angle: 360 * 3.141592653589793 / 180,
                        title: "Water",
                        isWater: true,
                        number:
                            "${controller.getDataModel.data?.waterQuantity}",
                        icon: Icons.water_drop,
                        description:
                            "goal ${controller.getDataModel.data?.waterNeeded} ml",
                        color: const Color(0xff65ACE0),
                        percent: controller.percentWater,
                        onTapAddWater: () {
                          controller.update();
                          controller.addWater();
                          controller.update();
                          log("Add Water");
                        },
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
