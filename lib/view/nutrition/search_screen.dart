import 'package:be_healthy/controller/search_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/widget/nutrition/custom_textfield_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchFoodController controller = Get.put(SearchFoodController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              CustomTextFieldSearch(
                titleappbar: "FindYourFood".tr,
                // onFieldSubmitted: (){},
                onPressedSearch: () {
                  controller.getData();
                },
                onFieldSubmitted: (val) {
                  controller.getData();
                },
                mycontroller: controller.search,
              ),
              GetBuilder<SearchFoodController>(
                builder: (controller) => controller.isLoading
                    ? Center(
                        heightFactor: 2.5,
                        child: Lottie.asset("assets/lotties/loading.json",
                            width: 200, height: 200),
                      )
                    : controller.isSearch
                        ? const ListItemSearch()
                        : Center(
                            heightFactor: 1.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset("assets/lotties/nodata.json",
                                    width: 250, height: 250, repeat: true),
                                Center(
                                    child: Text(
                                  "NoFood".tr,
                                  style: TextStyle(
                                      color:
                                          AppColor.primaryColor.withAlpha(150),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ))
                              ],
                            ),
                          ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListItemSearch extends GetView<SearchFoodController> {
  const ListItemSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.foodAllCategoryModel.data?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Card(
              surfaceTintColor: Colors.transparent,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListTile(
                  title: Text(
                      "${controller.foodAllCategoryModel.data![index].name}"),
                  titleTextStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary),
                  // subtitle: Text("180"),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.add,
                      size: 40,
                      color: Color(0xff8B529A),
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          title: "Attention!",
                          cancelTextColor: AppColor.primaryColor,
                          confirmTextColor: Colors.white,
                          buttonColor: AppColor.primaryColor,
                          middleText:
                              "Are you sure you want to eat\n${controller.foodAllCategoryModel.data?[index].name}?",
                          onCancel: () {
                            print("cancel");
                          },
                          onConfirm: () {
                            print("confirm");
                            controller.nutritionDetailsController.sendPostRequest(
                                "${controller.foodAllCategoryModel.data![index].calorie}");
                            Get.back();
                            Get.snackbar(
                                snackPosition: SnackPosition.BOTTOM,
                                "Nutrition",
                                "The ${controller.foodAllCategoryModel.data![index].calorie} was added successfully");
                          });
                    },
                  ),
                  trailing: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "${controller.foodAllCategoryModel.data![index].calorie}",
                        style:
                            const TextStyle(fontSize: 22, color: Colors.white),
                      )),
                ),
              ),
            ),
          );
        });
  }
}
