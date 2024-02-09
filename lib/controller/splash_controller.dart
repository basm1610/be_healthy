import 'package:get/get.dart';

import '../view/onboarding/onboarding_one.dart';

class SplashController extends GetxController{

 @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 1000), () {
      Get.off(()=> const OnBoardingOne());
    });
  }
}