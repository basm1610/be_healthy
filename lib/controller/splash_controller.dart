import 'package:be_healthy/view/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';


class SplashController extends GetxController{

 @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 1200), () {
      Get.off(()=> const OnBoardingScreen());
    });
  }
}