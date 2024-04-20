import 'package:be_healthy/controller/mydata_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../../core/constant/color.dart';

class CardHeight extends StatelessWidget {
  const CardHeight({
    super.key,
    required this.controller,
  });

  final MyDataController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        surfaceTintColor: Colors.transparent,
        elevation: 10,
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height".tr,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Cm".tr,
                  )
                ],
              ),
              WheelChooser.integer(
                // listHeight: 100,

                listWidth: 100.0,

                onValueChanged: (height) {
                  controller.isHeight = height;
                },
                maxValue: 200,
                minValue: 1,
                initValue: controller.isHeight,
                horizontal: true,

                selectTextStyle: const TextStyle(
                  fontSize: 18,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                unSelectTextStyle:
                    const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ]),
      ),
    );
  }
}
