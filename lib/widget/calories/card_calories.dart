import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CardCalories extends StatelessWidget {
  const CardCalories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              width: double.infinity,
              child: Card(
                surfaceTintColor: Colors.transparent,
                elevation: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 10.0,
                    percent: .5,
                    animation: true,
                    header: const Text(
                      "Calories",
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("750",
                            style: GoogleFonts.inter(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        Text(
                          "/1500",
                          style: GoogleFonts.inter(
                              fontSize: 20, color: const Color(0xff646363)),
                        ),
                      ],
                    ),
                    progressColor: AppColor.primaryColor,
                    footer: const Text(
                      "750 left",
                      style: TextStyle(fontSize: 18, color: Color(0xff646363)),
                    ),
                  ),
                ),
              ),
            );
  }
}