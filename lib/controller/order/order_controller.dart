import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/model/food_category_model.dart';
import 'package:be_healthy/view/order/order_details_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  FoodCategoryModel foodCategoryModel = FoodCategoryModel();



 
  getData() async {
    final response = await http.get(Uri.parse(AppLink.categoryRestaurant));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      foodCategoryModel = FoodCategoryModel.fromJson(jsonResponse);
      log("Data: ${jsonResponse["data"][0]["name"]}");
    }
    update();
  }

   goToOrderDetails(String id) {
    // Get.to(OrderDetailsScreen(),arguments: {"id":id});
    Get.toNamed(AppRouts.orderDetails,arguments: {"id":id});
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
