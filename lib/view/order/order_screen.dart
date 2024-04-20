import 'package:be_healthy/controller/order_controller.dart';
import 'package:be_healthy/widget/home/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/order/order_card_widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.put(OrderController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            // physics: NeverScrollableScrollPhysics(),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidgetHome(isHome: false,),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Order food online",
                style: TextStyle(
                    color: Color(0xff6A6A6A),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              OrderCardWidget(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}


