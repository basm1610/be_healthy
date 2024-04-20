import 'package:be_healthy/controller/home_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/widget/home/appbar_widget.dart';
import 'package:be_healthy/widget/home/banner_home.dart';
import 'package:be_healthy/widget/home/card_calories.dart';
import 'package:be_healthy/widget/home/custom_drawer.dart';
import 'package:be_healthy/widget/home/exercise_section.dart';
import 'package:be_healthy/widget/home/nutrition_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
          automaticallyImplyLeading: false,
          title: Builder(
            builder: (context) => AppBarWidgetHome(
                isHome: true,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }),
          ),
        ),
        drawer: const CustomDrawer(), //Drawer,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              const BannerHome(),
              const SizedBox(
                height: 20,
              ),
              const ExerciseSection(),
              const SizedBox(
                height: 5,
              ),
              CardCaloriesHome(
                onTap: () {
                  controller.goToCaliorsScreen();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Nutrition",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const NutritionSection(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
