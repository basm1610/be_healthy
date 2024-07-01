import 'package:be_healthy/controller/order/order_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/widget/offline_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/order/order_card_widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.put(OrderController());
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
      body: Obx(() => controller.networkService.isConnected.value
          ? SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                child: SingleChildScrollView(
                  child: Column(
                    // physics: NeverScrollableScrollPhysics(),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Order food online",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
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
              ),
            )
          : const OfflineWidget()),
    );
  }
}
