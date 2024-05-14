import 'package:be_healthy/controller/calories/add_water_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/widget/login/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddWaterScreen extends StatelessWidget {
  const AddWaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(AddWaterController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Water",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        // titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.water_drop,
              color: AppColor.primaryColor,
              size: 30,
            ),
          )
        ],
      ),
      body: GetBuilder<AddWaterController>(
          builder: (controller) => Center(
                heightFactor: 5,
                child: TextFieldWidgetAuth(
                  icon: Icons.add_box_outlined,
                  hintText: "add water",
                  label: "Add",
                  controller: controller.addWater,
                  keyboardType: TextInputType.number,
                  onTapIcon: () {
                    controller.sendPostRequest();
                  },
                ),
              )),
    );
  }
}
