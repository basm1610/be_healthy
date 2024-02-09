import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAndSubTitle extends StatelessWidget {
  final String title;
  final String subTitle;
   const TitleAndSubTitle({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style:
                GoogleFonts.inter(fontSize: 36, fontWeight: FontWeight.bold)),
        Text(
          textAlign: TextAlign.center,
          subTitle,
          style: GoogleFonts.inter(fontSize: 18),
        )
      ],
    );
  }
}
