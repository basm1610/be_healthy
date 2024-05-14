import 'package:be_healthy/controller/auth/login_controller.dart';
import 'package:be_healthy/controller/auth/signup_controller.dart';
import 'package:be_healthy/core/class/curd.dart';

import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut(() => SignUpController(),fenix: true);
    Get.lazyPut(() => LoginController(),fenix: true);
  }

}