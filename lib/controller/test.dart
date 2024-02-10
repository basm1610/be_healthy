import 'package:get/get.dart';

class testController extends GetxController {
  int number = 0;

  add() {
    number++;
    update();
  }

  minus() {
    if (number > 0) {
      number--;
      update();
    }
  }
}
