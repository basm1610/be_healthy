import 'package:be_healthy/controller/order/order_details_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/widget/order_details/card_image.dart';
import 'package:be_healthy/widget/order_details/description_card_image.dart';
import 'package:be_healthy/widget/order_details/rating_product.dart';
import 'package:be_healthy/widget/order_details/section_of_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../widget/order_details/button_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());

    return GetBuilder<OrderDetailsController>(
        builder: (controller) => controller.isLoading
            ? Center(
                heightFactor: 2.5,
                child: Lottie.asset("assets/lotties/loading.json",
                    width: 200, height: 200),
              )
            : Scaffold(
                appBar: AppBar(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xffC05DDA),
                  title: GetBuilder<OrderDetailsController>(
                      builder: (controller) => Text(
                            "${controller.restaurantModel.data?.name}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          )),
                  centerTitle: true,
                ),
                body: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(
                      children: [
                        //////////////////CardImage/////////////////////////////////////
                        CardImage(
                            image: "${controller.restaurantModel.data?.image}"),
                        ////////////////////DescriptionOfCardImage//////////////////////
                        const DescriptionOfCardImage(
                            name: "Chicken, French food, grills"),
                        ////////////////////SizedBox////////////////////////////////////
                        const SizedBox(height: 10),
                        ////////////////////RatingProduct///////////////////////////////
                        RatingProduct(
                            controller: controller,
                            initialRating: controller.rating),
                        //////////////OrderDetailsButtonWidget//////////////////////////
                        OrderDetailsButtonWidget(
                            onPressed: () {
                              controller.goLaunchUrl();
                            },
                            name: 'show resturant details',
                            color: AppColor.primaryColor,
                            isTrue: true),
                        ///////////// descreption of product ///////////////////////////
                        Text(
                          "${controller.restaurantModel.data?.description}",
                          style: const TextStyle(fontSize: 13),
                        ),
                        ////////////////////SizedBox/////////////////////////////////////
                        const SizedBox(height: 15),
                        ///////////// text of review ///////////////////////////////////
                        const Text(
                          "Reviews",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        //////////// number of rating //////////////////////////////////
                        GetBuilder<OrderDetailsController>(
                          builder: (controller) => Text(
                            "Rating ${controller.restaurantModel.data?.rate}",
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        ////////////////////SizedBox////////////////////////////////////
                        const SizedBox(height: 10),
                        /////////////////SectionOfRating////////////////////////////////
                        const SectionOfRating(),
                        //////////////OrderDetailsButtonWidget//////////////////////////
                        OrderDetailsButtonWidget(
                          name: "Copy BeHealthy to get 10% discount",
                          color: const Color(0xff2E9C13),
                          onPressed: () {
                            // controller.showAlert();
                             Clipboard.setData(ClipboardData(text: "BE-HEALTHY"));
                            Get.snackbar('Copied!', 'Text copied to clipboard.', 
                              snackPosition: SnackPosition.BOTTOM);
                          },
                          isTrue: false,
                        ),
                      ],
                    ))));
  }
}
