import 'dart:developer';

import 'package:be_healthy/controller/home_controller.dart';
import 'package:be_healthy/controller/setting_controller.dart';
import 'package:be_healthy/controller/theme_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/core/localization/change_lang.dart';
import 'package:be_healthy/widget/login/custom_button.dart';
import 'package:be_healthy/widget/settingss/custom_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    SettingController settingController = Get.put(SettingController());

    return Scaffold(
      // appBar: AppBar(),
      bottomSheet: GetBuilder<ThemeController>(
          builder: (controller) => Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height / 1.411,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground
                    // Color(0xffEBE3DE)
                    ,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    border: Border.all(color: Colors.black)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "",
                    ),
                    CustomRow(
                      text: "Language".tr,
                      isLang: true,
                      onSelected: (value) {
                        settingController.changelanguage(value.toString());
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "DarkMood".tr,
                    ),
                    CustomRow(
                      text: "Appearance".tr,
                      isDarkMood: true,
                      value: themeController.isDarkMode.value,
                      onChanged: (val) {
                        themeController.toggleTheme();
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomRow(
                      text: "ContactUs".tr,
                      icon: Icons.contact_support,
                      onPressedIcon: () {
                        settingController.goToContactUsScreen();
                      },
                    ),
                    // CustomButton(
                    //   text: "ar",
                    //   onPressed: () {
                    //     localeController.changeLange("ar");
                    //     log("lang is: ${localeController.myServices.sharedPreferences.getString("lang")}");
                    //     homeController.getNutritionData();
                    //     // themeController.getData();
                    //   },
                    // ),
                    // CustomButton(
                    //   text: "en",
                    //   onPressed: () {
                    //     localeController.changeLange("en");
                    //     log("lang is: ${localeController.myServices.sharedPreferences.getString("lang")}");
                    //     homeController.getNutritionData();

                    //     // themeController.getData();
                    //   },
                    // ),
                  ],
                ),
              )),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/setting.png"),
              Positioned(
                left: 20,
                top: 40,
                child: Text(
                  "Settings".tr,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          // Container(
          //   color: Colors.amber,
          //   // height: MediaQuery.of(context).size.height,
          //   height: 600,
          //   // width: 250,
          // )
        ],
      ),
    );
  }
}
