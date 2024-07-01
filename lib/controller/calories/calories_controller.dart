import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:be_healthy/model/get_data_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CaloriesController extends GetxController {
  GetDataModel getDataModel = GetDataModel();
  late String data;
  MyServices myServices = Get.find();
  bool isLoading = false;
  double percentCalories = 0;
  double percentWater = 0;
  double percentSteps = 0;
  Color colorCaloris = Colors.red;
  Color? colorWater;
  var todaySteps = '0'.obs;
  var savedSteps = ''.obs;
  var currentDay = 0.obs;
  var lastDay = 0.obs;

  Stream<StepCount>? stepCountStream;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // function is used to get AllData
  getData() async {
    isLoading = true;
    update();
    final response = await http.get(
      Uri.parse(AppLink.getData),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${myServices.sharedPreferences.getString("token")}', // using token
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      getDataModel = GetDataModel.fromJson(jsonResponse);
      data = "${getDataModel.data?.caloriesAdded}";
      if ((jsonResponse['data']['caloriesAdded']) >=
          (jsonResponse['data']['caloriesNeeded'])) {
        percentCalories = 1.0;
        colorCaloris;
      } else {
        percentCalories = (jsonResponse['data']['caloriesAdded']) /
            (jsonResponse['data']['caloriesNeeded']);
        colorCaloris = AppColor.primaryColor;
      }

      if ((jsonResponse['data']['waterQuantity']) >=
          (jsonResponse['data']['waterNeeded'])) {
        percentWater = 1.0;
        colorWater = Colors.red;
      } else {
        percentWater = (jsonResponse['data']['waterQuantity']) /
            (jsonResponse['data']['waterNeeded']);
      }
      percentSteps = double.parse(todaySteps.value) / 100;
      log("Data: $jsonResponse");
      log("percentWater: $percentCalories");
    }
    isLoading = false;
    update();
  }

  goToAddWater() {
    Get.toNamed(AppRouts.addWater);
  }

  Future<void> addWater() async {
    isLoading = true;
    update();
    var response = await http.post(Uri.parse(AppLink.addWaterAndCalorie),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${myServices.sharedPreferences.getString("token")}',
        },
        body: jsonEncode({
          "waterQuantity": "250",
        }));
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      log("success");
      log("response === ${response.body}");
      getData();
      Get.snackbar(
        snackPosition: SnackPosition.BOTTOM,
        "attention",
        "Add 250 ml of Water Success",
        duration: const Duration(seconds: 2),
        icon: const Icon(
          FontAwesomeIcons.clipboardCheck,
          size: 35,
        ),
      );
    } else if (jsonResponse['status'] == "fail") {
      log("${jsonResponse['status']}");
      log("${jsonResponse['message']}");
      Get.snackbar(
        snackPosition: SnackPosition.BOTTOM,
        "attention",
        "${jsonResponse['message']}",
        duration: const Duration(seconds: 2),
        icon: const Icon(
          Icons.error_rounded,
          size: 35,
        ),
      );
    } else {
      log("${response.statusCode}");
      log("fiald");
    }
    isLoading = false;
    update();
  }

  void loadData() async {
    final SharedPreferences prefs = await _prefs;
    currentDay.value = prefs.getInt('currentDay') ?? DateTime.now().day;
    todaySteps.value = prefs.getString('todaySteps') ?? '0';
  }

  Future<void> onStepCount(StepCount event) async {
    final SharedPreferences prefs = await _prefs;
    savedSteps.value = prefs.getString('savedSteps') ?? event.steps.toString();
    prefs.setString('savedSteps', savedSteps.value);

    currentDay.value = DateTime.now().day;
    lastDay.value = prefs.getInt('lastDay') ?? currentDay.value;
    prefs.setInt('lastDay', lastDay.value);
    if (currentDay.value != lastDay.value) {
      lastDay.value = currentDay.value;
      savedSteps.value = event.steps.toString();
      todaySteps.value = '0';
      prefs.setInt('lastDay', lastDay.value);
      prefs.setString('savedSteps', savedSteps.value);
      prefs.setString('todaySteps', todaySteps.value);
    }

    todaySteps.value = (event.steps - int.parse(savedSteps.value)).toString();
  }

  void onStepCountError(error) {
    todaySteps.value = 'Step Count not available';
  }

  void initPlatformState() async {
    if (await Permission.activityRecognition.request().isGranted) {
      stepCountStream = Pedometer.stepCountStream;
      stepCountStream!.listen(onStepCount).onError(onStepCountError);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getData();
    loadData();
    initPlatformState();
  }

  @override
  void onClose() {
    _prefs.then((SharedPreferences prefs) {
      prefs.setString('todaySteps', todaySteps.value);
      prefs.setInt('currentDay', currentDay.value);
    });
    super.onClose();
  }
}
