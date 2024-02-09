import 'package:be_healthy/view/auth/login_screen.dart';
import 'package:be_healthy/view/onboarding/onboarding_three.dart';
import 'package:be_healthy/view/onboarding/onboarding_two.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  goToOnBoardingtwo() {
    Get.to(()=>const OnBoardingTwo());
  }

  goToOnBoardingthree() {
    Get.to(()=>const OnBoardingThree());
  }

  backScreen() {
    Get.back();
  }

  goTologin() {
    Get.offAll(()=>const LoginScreen());
  }
}
