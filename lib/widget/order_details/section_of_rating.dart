import 'package:be_healthy/controller/order/order_details_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/widget/order_details/card_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionOfRating extends StatelessWidget {
  const SectionOfRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailsController>(
      builder: (controller) => SizedBox(
        height: MediaQuery.of(context).size.height * .21,
        // color: Colors.amber,
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.title.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 24,
              // width / height: fixed for *all* items
              childAspectRatio: 2.2,
            ),
            itemBuilder: (context, index) {
              return CardRating(
                // color: Colors.white,
                colorIcon: controller.isSelected == index
                    ? Colors.white
                    : Colors.black,
                colorIconRate: controller.isSelected == index
                    ? Colors.white
                    : const Color(0xff57046B),
                colorText: controller.isSelected == index
                    ? Colors.white
                    : const Color(0xff746F6F),
                color: controller.isSelected == index
                    ? AppColor.thirdColor
                    : Colors.white,
                title: controller.title[index],
                iconFace: controller.iconFace[index],
                iconRate: Icons.star,
                count: index + 1,
                onTap: () {
                  controller.selectedItems(index);
                  
                },
              );
            }),
      ),
    );
  }
}
