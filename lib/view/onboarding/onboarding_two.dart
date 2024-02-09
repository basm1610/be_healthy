import 'package:be_healthy/widget/onboarding/appbar.dart';
import 'package:be_healthy/widget/onboarding/bottombar.dart';
import 'package:be_healthy/widget/onboarding/title-subtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.put(OnBoardingController());

    return Scaffold(
        backgroundColor: Colors.white,
        body: const Column(
          children: [
            AppBarWidget(),
            TitleAndSubTitle(
                title: "Motivation",
                subTitle: "Through discipline comes freedom")
          ],
        ),
        bottomNavigationBar: BottomBarWidget(
          isBack: true,
          onPressednext: () {
            controller.goToOnBoardingthree();
          },
          onTapBack: () {
            controller.backScreen();
          },
        ));
  }
}
