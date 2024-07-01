import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
        //  Row(children: [
        //   Image.asset(
        //     "assets/images/logo.png",
        //     width: 60,
        //     height: 60,
        //   ),
        //   Text(
        //     "TextSplashScreen".tr,
        //     style: GoogleFonts.inter(
        //         // fontWeight: FontWeight.w900,
        //         shadows: <Shadow>[
        //           Shadow(
        //             offset: const Offset(4, 4),
        //             blurRadius: 4.0,
        //             color: const Color(0xff000000).withOpacity(.2),
        //           ),
        //         ],
        //         fontSize: 40,
        //         color: AppColor.thirdColor
        //         // style:
        //         //     GoogleFonts.robotoCondensed(fontSize: 50, color: Color(0xff662e75)
        //         ),
        //   )
        // ])
        CircleAvatar(
      radius: 80,
      backgroundColor: AppColor.fourthColor.withOpacity(.5),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Center(
          //     child: SizedBox(
          //         child: SvgPicture.asset(
          //   "assets/images/icon.svg",
          //   semanticsLabel: 'My SVG Image',
          //   width: 70,
          //   height: 70,
          // ))),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/images/logo.png",
            // width: 60,
            // height: 70,
          ),
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
                  fontSize: 25,
                  color: Colors.white)),
        ],
      ),
    );
  }
}
