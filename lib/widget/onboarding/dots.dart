import 'package:be_healthy/controller/onboarding_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/data/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(builder: ((controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 12),
              duration: const Duration(milliseconds: 500),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: controller.currentPage == index
                      ? AppColor.primaryColor
                      : Color(0xffD9D9D9)),
            ),
          ),
        ],
      );
    }));
  }
}
