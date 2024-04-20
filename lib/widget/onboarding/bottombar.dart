import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarWidget extends StatelessWidget {
  final void Function()? onPressednext;
    
  const BottomBarWidget({
    super.key,
    this.onPressednext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48)),
              color: AppColor.primaryColor,
              onPressed: onPressednext,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ButtonOnBoarding".tr,
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  const Icon(
                    Icons.arrow_right_outlined,
                    color: Colors.white,
                    // size: ,
                  )
                ],
              ),
            )
          ]),
    );
  }
}
