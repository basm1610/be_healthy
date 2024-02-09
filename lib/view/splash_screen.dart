import 'package:be_healthy/controller/splash_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: const Color(0xffDBB3FB),
      // appBar: AppBar(),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: SizedBox(
                  // height: 100,
                  child: SvgPicture.asset(
            "assets/images/icon.svg",
            semanticsLabel: 'My SVG Image',
          ))),
          Text("Be Healthy",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w900,
                  shadows: <Shadow>[
                    Shadow(
                      offset: const Offset(4, 4),
                      blurRadius: 4.0,
                      color: const Color(0xff000000).withOpacity(.2),
                    ),
                  ],
                  fontSize: 36,
                  color: AppColor.thirdColor))
        ],
      ),
    );
  }
}
