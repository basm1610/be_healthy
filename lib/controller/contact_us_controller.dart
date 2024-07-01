import 'dart:convert';
import 'dart:developer';

import 'package:be_healthy/core/constant/link_api.dart';
import 'package:be_healthy/core/services/myservices.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;

class ContactUsController extends GetxController {
  late TextEditingController textFeedback;
GlobalKey<FormState> formState = GlobalKey<FormState>();  MyServices myServices = Get.find();
  String? name;
  bool isLoading = false;

  String email = Uri.encodeComponent("BeHealthy@gmail.com");

  Future<void> goLaunchUrl() async {
    if (!await launchUrlString("tel://01050625339")) {
      throw Exception('Could not launch ');
    }
  }

  Future<void> openEmail() async {
    if (!await launchUrl(Uri.parse(
        "mailto:$email?subject=${Uri.encodeComponent("Hello $name")}"))) {
      throw Exception('Could not launch $email');
    }
  }

  Future<void> sendFeedback() async {
    if(formState.currentState!.validate()){
      isLoading = true;
    update();
    var response = await http.post(Uri.parse(AppLink.feedback),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${myServices.sharedPreferences.getString("token")}',
        },
        body: jsonEncode({
          "feedback": textFeedback.text,
        }));
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      log("success");
      log("response === ${response.body}");
      Get.snackbar(
        snackPosition: SnackPosition.BOTTOM,
        "attention".tr,
        "Yourfeedbackhasbeensentsuccessfully".tr,
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
  }

  @override
  void onInit() {
    textFeedback = TextEditingController();
    name = myServices.sharedPreferences.getString("name");
    super.onInit();
  }

  @override
  void dispose() {
    textFeedback.dispose();
    super.dispose();
  }
}
