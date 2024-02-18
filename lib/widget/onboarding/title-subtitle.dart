import 'package:be_healthy/controller/onboarding_controller.dart';
import 'package:be_healthy/data/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAndSubTitle extends  StatelessWidget{
  const TitleAndSubTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller =Get.put(OnBoardingController());
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(onBoardingList[index].title!,
                  style: GoogleFonts.inter(
                      fontSize: 36, fontWeight: FontWeight.bold)),
              Text(
                textAlign: TextAlign.center,
                onBoardingList[index].description!,
                style: GoogleFonts.inter(fontSize: 18),
              )
            ],
          );
        });
  }
}
