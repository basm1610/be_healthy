import 'package:be_healthy/model/nutrition_model.dart';
import 'package:be_healthy/view/nutrition/nutrition_details.dart';
import 'package:get/get.dart';

class NutritionController extends GetxController {
  late NutritionModel nutritionModel;
  static List<String> images = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
    "assets/images/8.png",
  ];
  static List<String> title = [
    "Salad",
    "Meat",
    "Bread",
    "juices",
    "vegetables",
    "Fish",
    "Dessert",
    "Fruit",
  ];
  List<NutritionModel> data = List.generate(title.length,
      (index) => NutritionModel(title[index], images[index]));
  goToPageNutritionDetails(NutritionModel nutritionModel) {
    Get.to(NutritionDetailsScreen(
      nutritionModel: nutritionModel,
    ));
  }
}
