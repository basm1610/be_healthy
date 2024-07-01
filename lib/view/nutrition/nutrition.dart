import 'package:be_healthy/controller/nutrition/nutrition_controller.dart';
import 'package:be_healthy/widget/nutrition/nutrition_body_widget.dart';
import 'package:be_healthy/widget/offline_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NutritionController controller = Get.put(NutritionController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nutrition".tr,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSecondary),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(
                left:
                    controller.myServices.sharedPreferences.getString("lang") ==
                            "ar"
                        ? 10
                        : 0,
                right:
                    controller.myServices.sharedPreferences.getString("lang") ==
                            "ar"
                        ? 0
                        : 10),
            child: IconButton(
                onPressed: () {
                  controller.goToSearch();
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Theme.of(context).colorScheme.onSecondary,
                )),
          )
        ],
      ),
      body: Obx(
        () => controller.connectivityService.isConnected
            ? const NutritionBodyWidget()
            : const OfflineWidget(),
      ),
    );
  }
}
