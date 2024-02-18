import 'package:be_healthy/controller/mydata_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardGender extends GetView<MyDataController> {
  final void Function()? onTap;
  final IconData? icon;
  final String title;
  final bool isGenderMale;
  final String isGenderChecked;
  const CardGender(
      {super.key,
      required this.isGenderMale,
      required this.onTap,
      required this.icon,
      required this.title,
      required this.isGenderChecked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: controller.isMale == isGenderChecked
            ? const Color.fromARGB(255, 228, 120, 255)
            : Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
          child: Column(
            children: [
              Icon(
                icon,
                size: 80,
                color: isGenderMale == false
                    ? controller.isMale == isGenderChecked
                        ? const Color(0xffff00f5)
                        : const Color(0xffFF60F9)
                    : const Color(0xff3223DF),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    color: controller.isMale == isGenderChecked
                        ? Colors.white
                        : Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
