import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeTextAndIcon extends StatelessWidget {
  const LargeTextAndIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/images/icon.svg",
          semanticsLabel: 'My SVG Image',
        ),
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
                fontSize: 38,
                color: AppColor.thirdColor))
      ],
    );
  }
}
