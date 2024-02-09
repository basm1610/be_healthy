import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomStackWidget extends StatelessWidget {
  final String text;
  const CustomStackWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.center,
      children: [
        Container(),
        const Positioned(
            top: -60,
            right: -60,
            child: CircleAvatar(
              backgroundColor: AppColor.secondColor,
              radius: 130,
            )),
        const Positioned(
          bottom: -20,
          left: 25,
          child: CircleAvatar(
            backgroundColor: AppColor.secondColor,
            radius: 30,
          ),
        ),
        const Positioned(
          bottom: 50,
          left: -5,
          child: CircleAvatar(
            backgroundColor: AppColor.secondColor,
            radius: 10,
          ),
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
