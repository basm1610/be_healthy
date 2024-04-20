import 'dart:developer';

import 'package:be_healthy/controller/mydata_controller.dart';
import 'package:be_healthy/widget/mydata/custom_button_data.dart';
import 'package:be_healthy/widget/mydata/card_age.dart';
import 'package:be_healthy/widget/mydata/card_gender.dart';
import 'package:be_healthy/widget/mydata/card_height.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    MyDataController controller = Get.put(MyDataController());
    return Scaffold(
      bottomNavigationBar:
       CustomButtonData(
        title: "Continue".tr,
        controller: controller,
        onPressed: () {
          log("Gender is ${controller.isMale}");
          log("select height is ${controller.isHeight}");
          log("select Age is ${controller.number}");
          controller.goToScreenTwoData();
        },
      ),
      appBar: AppBar(
        title:  Text(
          "MyData".tr,
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GetBuilder<MyDataController>(
                  builder: (controller) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CardGender(
                            isGenderMale: true,
                            onTap: () {
                              controller.checkGenderMale();
                            },
                            icon: FontAwesomeIcons.mars,
                            title: "Male".tr,
                            isGenderChecked: "male",
                          ),
                          CardGender(
                            isGenderMale: false,
                            onTap: () {
                              controller.checkGenderFemale();
                            },
                            icon: FontAwesomeIcons.venus,
                            title: "Female".tr,
                            isGenderChecked: "female",
                          ),
                        ],
                      )),
              CardHeight(controller: controller),
              const CardAge()
            ],
          ),
        ],
      ),
    );
  }
}
