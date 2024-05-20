import 'package:be_healthy/controller/order/order_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .79,
      // color: Colors.amber,
      child: GetBuilder<OrderController>(
          builder: (controller) => GridView.builder(
              // padding: EdgeInsets.all(10),

              // shrinkWrap: true,
              itemCount: controller.foodCategoryModel.data?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // crossAxisSpacing: 10,
                  childAspectRatio: .9,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // log("${controller.data[index].title}");
                    controller.goToOrderDetails(
                        "${controller.foodCategoryModel.data![index].sId}");
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          image: NetworkImage(
                            "${controller.foodCategoryModel.data![index].image}",
                          ),
                          // color: Colors.black,
                          fit: BoxFit.fill,
                          width: 165,
                          height: 150,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: AppColor.thirdColor,
                          ),
                          Text(
                            "${controller.foodCategoryModel.data![index].name}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff555252)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
