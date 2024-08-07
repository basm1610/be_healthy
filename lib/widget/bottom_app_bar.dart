import 'package:be_healthy/controller/main_home_controller.dart';
import 'package:be_healthy/widget/button_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class BottomAppBarWidget extends GetView<MainHomeController> {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              shape: const CircularNotchedRectangle(),
              height:
                  controller.myServices.sharedPreferences.getString("lang") ==
                          "ar"
                      ? 65
                      : 80,
              notchMargin: 10,
              elevation: 20,
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.white,
              child: Row(
                children: [
                  ...List.generate(controller.listPage.length + 1, (index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? Spacer()
                        : GetBuilder<MainHomeController>(builder: (controller)=>ButtonAppBarWidget(
                            onPressed: () {
                              controller.onChangePage(i);
                              controller.update();
                            },
                            text: "${controller.titleBottomBar[i]}".tr,
                            icon: controller.iconBottomBar[i],
                            active:
                                controller.currentIndex == i ? true : false));
                  })
                ],
              ),
            );
  }
}
