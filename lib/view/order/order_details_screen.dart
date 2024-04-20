import 'package:be_healthy/controller/order_details_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/model/order_meal_model.dart';
import 'package:be_healthy/widget/order_details/card_image.dart';
import 'package:be_healthy/widget/order_details/description_card_image.dart';
import 'package:be_healthy/widget/order_details/rating_product.dart';
import 'package:be_healthy/widget/order_details/section_of_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/order_details/button_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderMealModel orderMealModel;
  const OrderDetailsScreen({super.key, required this.orderMealModel});

  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xffC05DDA),
          title: Text(
            "${orderMealModel.title}",
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                //////////////////CardImage/////////////////////////////////////
                CardImage(orderMealModel: orderMealModel),
                ////////////////////DescriptionOfCardImage//////////////////////
                const DescriptionOfCardImage(
                    name: "Chicken, French food, grills"),
                ////////////////////SizedBox////////////////////////////////////
                const SizedBox(height: 10),
                ////////////////////RatingProduct///////////////////////////////
                RatingProduct(controller: controller),
                //////////////OrderDetailsButtonWidget//////////////////////////
                OrderDetailsButtonWidget(
                    onPressed: () {},
                    name: 'show resturant details',
                    color: AppColor.primaryColor,
                    isTrue: true),
                ///////////// descreption of product ///////////////////////////
                const Text(
                  "It serves dishes from chicken cuisine and delivers to New Maadi - Degla and Shuwaikh. This restaurant received a rating of 4.5 according to 138 reviews from Talabat users.",
                  style: TextStyle(fontSize: 13),
                ),
                ////////////////////SizedBox/////////////////////////////////////
                const SizedBox(height: 15),
                ///////////// text of review ///////////////////////////////////
                const Text(
                  "Reviews",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                //////////// number of rating //////////////////////////////////
                GetBuilder<OrderDetailsController>(
                  builder: (controller) => Text(
                    "Rating ${controller.rating}",
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
                  onPressed: () {},
                  isTrue: false,
                ),
              ],
            )));
  }
}
