import 'package:be_healthy/controller/onboarding_controller.dart';
import 'package:be_healthy/widget/onboarding/appbar.dart';
import 'package:be_healthy/widget/onboarding/bottombar.dart';
import 'package:be_healthy/widget/onboarding/title-subtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.put(OnBoardingController());

    return Scaffold(
        backgroundColor: Colors.white,
        body: const Column(
          children: [
            AppBarWidget(),
            TitleAndSubTitle(
                title: "Hi,there !",
                subTitle:
                    "this application will help you to achieve better results ")
          ],
        ),
        bottomNavigationBar: BottomBarWidget(
          isBack: false,
          onPressednext: () {
            controller.goToOnBoardingtwo();
          },
        ));
  }
}
