import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 80 ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: SizedBox(
                  child: SvgPicture.asset(
            "assets/images/icon.svg",
            semanticsLabel: 'My SVG Image',
            width: 50,
            height: 50,
          ))),
          Text("TextSplashScreen".tr,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w900,
                  shadows: <Shadow>[
                    Shadow(
                      offset: const Offset(4, 4),
                      blurRadius: 4.0,
                      color: const Color(0xff000000).withOpacity(.2),
                    ),
                  ],
                  fontSize: 20,
                  color: AppColor.thirdColor))
        ],
      ),
    );
  }
}
