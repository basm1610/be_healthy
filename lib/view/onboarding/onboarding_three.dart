import 'package:be_healthy/controller/onboarding_controller.dart';
import 'package:be_healthy/widget/onboarding/appbar.dart';
import 'package:be_healthy/widget/onboarding/bottombar.dart';
import 'package:be_healthy/widget/onboarding/title-subtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.put(OnBoardingController());

    return Scaffold(
        backgroundColor: Colors.white,
        body: const Column(
          children: [
            AppBarWidget(),
            TitleAndSubTitle(
                title: "Be careful",
                subTitle:
                    "We are here to take care of your health,activity and food")
          ],
        ),
        bottomNavigationBar: BottomBarWidget(
          isBack: true,
          onTapBack: () {
            controller.backScreen();
          },
          onPressednext: () {
            controller.goTologin();
          },
        ));
  }
}
