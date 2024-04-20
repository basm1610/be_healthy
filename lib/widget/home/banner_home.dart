import 'package:be_healthy/controller/home_controller.dart';
import 'package:flutter/material.dart';
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
            height: 117,
            width: 350,
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
          const Positioned(
              top: 30,
              left: 10,
              child: Text(
                "you can order by\nusing our coupon",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  // fontSize: 14
                ),
              )),
          const Positioned(
            bottom: 8,
            left: 15,
            child: Text(
              "Order   >",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
