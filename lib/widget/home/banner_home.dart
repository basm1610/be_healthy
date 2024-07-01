import 'package:be_healthy/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BannerHome extends GetView<HomeController> {
  const BannerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToOrderScreen();
      },
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .15,
            width: MediaQuery.of(context).size.width / .972,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [
                  const Color(0xffC05DDA),
                  const Color(0xffC05DDA).withOpacity(.3),
                ])),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/images/banner2.png",
              ),
            ),
          ),
          Positioned(
              top: 30.h,
              left: 10.w,
              child: Text(
                "TitleBannerHome".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  // fontSize: 14
                ),
              )),
          Positioned(
            bottom: 8.h,
            left: 15.w,
            child: Text(
              "Order".tr,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
