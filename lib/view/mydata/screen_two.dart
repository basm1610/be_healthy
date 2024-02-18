import 'dart:developer';
import 'package:be_healthy/controller/mydata_controller.dart';
import 'package:be_healthy/widget/mydata/card_weight.dart';
import 'package:be_healthy/widget/mydata/custom_button_data.dart';
import 'package:be_healthy/widget/mydata/custom_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    MyDataController controller = Get.put(MyDataController());
    return Scaffold(
        bottomNavigationBar: CustomButtonData(
            title: "Calculate",
            controller: controller,
            onPressed: () {
              log("select Item is ${controller.selectedValue}");
              log("select Item is ${controller.isWeigth}");
              controller.goTologin();
            }),
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: const Text(
            "MyData",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<MyDataController>(
          builder: (controller) => const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardWeight(),
              SizedBox(
                height: 25,
              ),
              CustomDropDownButton(),
            ],
          ),
        ));
  }
}
