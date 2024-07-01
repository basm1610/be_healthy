import 'dart:convert';
import 'dart:developer';
import 'package:be_healthy/controller/test/test_controller.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/favourite_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FavouriteController extends GetxController {
  Map isFavorite = {};
  MyServices myServices = Get.find();
  bool isLoading = false;
  late FavouriteModel favouriteModel = FavouriteModel();
  final ConnectivityService connectivityService = Get.find();

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  getData() async {
    if (connectivityService.isConnected) {
      isLoading = true;
      update();
      final response = await http.get(
        Uri.parse(AppLink.favourite),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${myServices.sharedPreferences.getString("token")}',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        favouriteModel = FavouriteModel.fromJson(jsonResponse);
        log("Data: $jsonResponse");
      }
      isLoading = false;
      update();
    } else{
      log("Not connect");

    }
  }

  deleteFav(String itemId) async {
    // getData();
    isLoading = true;
    update();
    final response = await http.delete(
      Uri.parse("${AppLink.deleteFavourite}$itemId"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${myServices.sharedPreferences.getString("token")}',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      getData();
      var jsonResponse = jsonDecode(response.body);
      favouriteModel = FavouriteModel.fromJson(jsonResponse);
      log("Data: $jsonResponse['message]");
      Get.snackbar("Success", "${jsonResponse["message"]}");
    }
    // getData();
    isLoading = false;
    update();
  }

  @override
  void onInit() async{
    super.onInit();
    await getData();
  }
}
