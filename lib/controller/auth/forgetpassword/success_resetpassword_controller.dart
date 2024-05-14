import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:get/get.dart';

class SuccessResetPasswordController extends GetxController {
  goToLogin() {
    Get.offAllNamed(AppRouts.login);
  }
}
