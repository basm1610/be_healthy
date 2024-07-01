import 'package:be_healthy/controller/main_home_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonAppBarWidget extends GetView<MainHomeController> {
  final void Function()? onPressed;
  final String text;
  final IconData icon;
  final bool active;
  const ButtonAppBarWidget(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.icon,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 10,
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(icon,
              color: active == true ? AppColor.primaryColor : AppColor.grey2),
          Text(
            text.tr,
            style: TextStyle(
                fontSize:
                    controller.myServices.sharedPreferences.getString("lang") ==
                            "ar"
                        ? 14
                        : 14,
                color: active == true ? AppColor.primaryColor : AppColor.grey2),
          ),
        ],
      ),
    );
  }
}
