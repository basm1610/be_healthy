import 'package:be_healthy/controller/onboarding_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/data/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAndSubTitle extends StatelessWidget {
  const TitleAndSubTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.put(OnBoardingController());
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
                      fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 50,
              ),
              Container(
                child: Image.asset(
                  onBoardingList[index].image!,
                  height: Get.width / 1.2,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  textAlign: TextAlign.center,
                  onBoardingList[index].description!,
                  style: GoogleFonts.inter(
                      fontSize: 18, height: 2, color: AppColor.textColor),
                ),
              )
            ],
          );
        });
  }
}
