import 'package:be_healthy/controller/mydata_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class CardWeight extends GetView<MyDataController> {
  const CardWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          children: [
            // const Text("Weight"),

            Card(
              surfaceTintColor: Colors.transparent,
              elevation: 10,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    children: [
                      const Text(
                        "Weight",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      WheelChooser.integer(
                        listWidth: 100.0,
                        onValueChanged: (weight) {
                          controller.isWeigth = weight;
                        },
                        maxValue: 200,
                        minValue: 1,
                        initValue: controller.isWeigth,
                        horizontal: true,
                        selectTextStyle: const TextStyle(
                          fontSize: 18,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        unSelectTextStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}
