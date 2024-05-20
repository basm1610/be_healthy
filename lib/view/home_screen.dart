import 'package:be_healthy/controller/home_controller.dart';

import 'package:be_healthy/widget/home/appbar_widget.dart';
import 'package:be_healthy/widget/home/banner_home.dart';
import 'package:be_healthy/widget/home/card_calories.dart';
import 'package:be_healthy/widget/home/custom_drawer.dart';
import 'package:be_healthy/widget/home/exercise_section.dart';
import 'package:be_healthy/widget/home/nutrition_section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Be Healthy",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            // iconTheme: IconThemeData(color: Colors.black),
            // // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
            // automaticallyImplyLeading: false,
            // title: Builder(
            //   builder: (context) => AppBarWidgetHome(
            //       isHome: true,
            //       onPressed: () {
            //         Scaffold.of(context).openDrawer();
            //       }),
            // ),
            leading: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  FontAwesomeIcons.barsStaggered,
                  color: Colors.black,
                ),
              ),
            )),
        drawer: const CustomDrawer(), //Drawer,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: ListView(
            children: [
              // const SizedBox(
              //   height: 30,
              // ),
              const BannerHome(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "WorkOut",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
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
