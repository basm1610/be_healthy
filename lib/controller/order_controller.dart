import 'package:be_healthy/model/order_meal_model.dart';
import 'package:be_healthy/view/order/order_details_screen.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  late OrderMealModel orderMealModel;
  static List<String> images = [
    "assets/images/brand1.png",
    "assets/images/brand2.png",
    "assets/images/brand3.png",
    "assets/images/brand4.png",
    "assets/images/brand5.png",
    "assets/images/brand6.png",
    "assets/images/brand7.png",
    "assets/images/brand8.png",
  ];
  static List<String> title = [
    "Coquette Resturant",
    "Bremer Resturant",
    "Stereo Resturan",
    "Paul Resturant",
    "Pasta Inn Resturant",
    "Chiqita Resturant",
    "Opps Resturant",
    "Pasta Cup Resturant",
  ];

  List<OrderMealModel> data = List.generate(
      title.length, (index) => OrderMealModel(title[index], images[index]));

  goToPageOrderMealDetails(OrderMealModel orderMealModel) {
    Get.to(OrderDetailsScreen(
      orderMealModel: orderMealModel,
    ));
  }

  
}
