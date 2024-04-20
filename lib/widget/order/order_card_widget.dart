import 'dart:developer';

import 'package:be_healthy/controller/order_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({
    super.key,
    required this.controller,
  });

  final OrderController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .79,
      // color: Colors.amber,
      child: GridView.builder(
          // padding: EdgeInsets.all(10),
    
          // shrinkWrap: true,
          itemCount: controller.data.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                log("${controller.data[index].title}");
                controller
                    .goToPageOrderMealDetails(controller.data[index]);
              },
              child: Column(
                children: [
                  Image(
                    image: AssetImage(
                      "${controller.data[index].image}",
                    ),
                    width: 150,
                    height: 140,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: AppColor.thirdColor,
                        ),
                        Text(
                          "${controller.data[index].title}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff555252)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}