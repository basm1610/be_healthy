import 'package:be_healthy/controller/home_controller.dart';
import 'package:be_healthy/core/constant/image_asset.dart';

import 'package:be_healthy/widget/home/appbar_widget.dart';
import 'package:be_healthy/widget/home/banner_home.dart';
import 'package:be_healthy/widget/home/card_calories.dart';
import 'package:be_healthy/widget/home/custom_drawer.dart';
import 'package:be_healthy/widget/home/exercise_section.dart';
import 'package:be_healthy/widget/home/nutrition_section.dart';
import 'package:be_healthy/widget/offline_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          // backgroundColor: Colors.white,
          title: Text(
            "TextSplashScreen".tr,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 25.sp,
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
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          )),
      drawer: const CustomDrawer(), //Drawer,
      body: Padding(
        padding:
            EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
        child: Obx(() => controller.connectivityService.isConnected
            ? ListView(
                children: [
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  const BannerHome(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Workouts".tr,
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                  const ExerciseSection(),
                  SizedBox(
                    height: 5.h,
                  ),
                  CardCaloriesHome(
                    onTap: () {
                      controller.goToCaliorsScreen();
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Nutrition".tr,
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                  const NutritionSection(),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              )
            : const OfflineWidget()),
      ),
    );
  }
}
