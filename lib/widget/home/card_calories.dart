import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardCaloriesHome extends StatelessWidget {
  final void Function()? onTap;
  const CardCaloriesHome({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 1.5,
      child: ListTile(
        onTap: onTap,
        contentPadding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
        title: Text("TitleCardCaloriesHome".tr,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Theme.of(context).colorScheme.onSecondary)),
        subtitle:  Text(
          "SubTitleCardCaloriesHome".tr,
          style: TextStyle(color: const Color(0xff6B7280), fontSize: 12.sp),
        ),
        trailing:  Text(
          "SeeAll".tr,
          style: const TextStyle(color: Color(0xff6B7280)),
        ),
      ),
    );
  }
}
