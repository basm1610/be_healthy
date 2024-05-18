import 'package:be_healthy/controller/order/order_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/order/order_card_widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Resturants",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<OrderController>(
          builder: (controller) => const SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: Column(
                    // physics: NeverScrollableScrollPhysics(),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // AppBarWidgetHome(
                      //   isHome: false,
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Order food online",
                          style: TextStyle(
                              color: Color(0xff6A6A6A),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OrderCardWidget(),
                    ],
                  ),
                ),
              )),
    );
  }
}
