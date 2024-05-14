import 'package:be_healthy/controller/onboarding_controller.dart';
import 'package:be_healthy/widget/onboarding/bottombar.dart';
import 'package:be_healthy/widget/onboarding/dots.dart';
import 'package:be_healthy/widget/onboarding/title-subtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              // const Expanded(flex: 3, child:  AppBarWidget()),
              const Expanded(
                flex: 3,
                child: TitleAndSubTitle(),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const DotsWidget(),
                    const SizedBox(
                      height: 50,
                    ),
                    GetBuilder<OnBoardingController>(
                      builder: ((controller) => BottomBarWidget(
                            onPressednext: () {
                              controller.next();
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
