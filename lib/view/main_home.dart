import 'package:be_healthy/controller/main_home_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/widget/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeController());
    return GetBuilder<MainHomeController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: const BottomAppBarWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FittedBox(
          child: FloatingActionButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {},
            backgroundColor: AppColor.primaryColor,
            elevation: 2.0,
            child: controller.currentIndex == 0
                ? const Icon(Icons.home, color: Colors.white)
                : controller.currentIndex == 1
                    ? const Icon(FontAwesomeIcons.nutritionix,
                        color: Colors.white)
                    : controller.currentIndex == 2
                        ? const Icon(FontAwesomeIcons.personWalking,
                            color: Colors.white)
                        : const Icon(FontAwesomeIcons.user,
                            color: Colors.white),
          ),
        ),
        body: GetBuilder<MainHomeController>(
            builder: (controller) =>
                controller.listPage.elementAt(controller.currentIndex)),
      );
    });
  }
}
