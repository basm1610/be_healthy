import 'dart:developer';
import 'package:be_healthy/controller/mydata_controller.dart';
import 'package:be_healthy/widget/mydata/card_weight.dart';
import 'package:be_healthy/widget/mydata/custom_button_data.dart';
import 'package:be_healthy/widget/mydata/custom_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(MyDataController());
    return GetBuilder<MyDataController>(builder: (controller)=>Scaffold(
        bottomNavigationBar: controller.isLoading ?
        Center(
                    
                    child: Lottie.asset("assets/lotties/loading.json",
                        width: 200, height: 200),
                  ):
         CustomButtonData(
            title: "Finish".tr,
            controller: controller,
            onPressed: () {
              controller.getValueFromList();
              controller.sendPostRequest();
              log("select Item is ${controller.selectedValue}");
              log("select Item is ${controller.isWeigth}");
              log("height ${controller.isHeight}");
              log("age ${controller.number}");
              log("genger ${controller.isGender}");
              log("Value ${controller.getValue}");
              // log("index of items: ${controller.items.indexOf("${controller.selectedValue}")}");
              // controller.goTologin();
            }),
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: Text(
            "MyData".tr,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
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
        )
        ));
  }
}
