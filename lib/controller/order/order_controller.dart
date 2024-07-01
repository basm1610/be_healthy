import 'dart:convert';
import 'dart:developer';
import 'package:be_healthy/controller/test/test_controller.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/model/food_category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  FoodCategoryModel foodCategoryModel = FoodCategoryModel();
  NetworkService networkService = Get.put(NetworkService());
  

  getData() async {
    if (networkService.isConnected.value) {
      final response = await http.get(Uri.parse(AppLink.categoryRestaurant));
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        foodCategoryModel = FoodCategoryModel.fromJson(jsonResponse);
        log("Data: ${jsonResponse["data"][0]["name"]}");
      }
      update();
    } else {
      log("Not connected");
    }
  }

  goToOrderDetails(String id, String name) {
    // Get.to(OrderDetailsScreen(),arguments: {"id":id});
    Get.toNamed(AppRouts.orderDetails, arguments: {"id": id, "name": name});
  }

  @override
  void onInit() async{
    super.onInit();
    await getData();
  }
}
