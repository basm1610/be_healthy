import 'package:be_healthy/controller/home_controller.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NutritionSection extends GetView<HomeController> {
  const NutritionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: GetBuilder<HomeController>(
        builder: (controller) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.foodCategoryModel.data?.length ?? 0,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              controller.goToNutritionScreen();
            },
            child: SizedBox(
              width: 150.w,
              child: Padding(
                padding:  EdgeInsets.only(right: 5.w),
                child: Card(
                  // color: Colors.white,
                  surfaceTintColor: Colors.transparent,
                  elevation: 4,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 10.h, left: 5.h, right: 5.h),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "${controller.foodCategoryModel.data?[index].image}"
                            // "${AppLink.imageCategoryFood}/${controller.foodCategoryModel.data?[index].image}"
                            ,
                            width: 200.w,
                            height: 130.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                         SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "${controller.foodCategoryModel.data?[index].name}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
