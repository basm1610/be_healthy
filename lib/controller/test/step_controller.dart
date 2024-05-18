import 'package:be_healthy/core/services/myservices.dart';
import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';

class StepController extends GetxController {
  late Stream<StepCount> stepCountStream;
  MyServices myServices = Get.find();
  Pedometer pedometer = Pedometer();
  int stepCountValue = 0;
  String totalCount = "0";
  var initialSteps = 0;
  late int value  ;
  void startListening() {
    pedometer = Pedometer();
    // firstSteps = Pedometer.stepCountStream.firstWhere((element) => false);
    Pedometer.stepCountStream.listen((StepCount event) {
      totalCount = '${event.steps}';
      update();
    });
  }

  void startCalculatingSteps() {
    Pedometer.stepCountStream.listen((StepCount event) {
      if (initialSteps == 0) {
        initialSteps = event.steps;
      }
      int stepsFromNow = event.steps - initialSteps;
      //   print("Steps from now: $stepsFromNow");
      stepCountValue = stepsFromNow;
      myServices.sharedPreferences.setInt("stepCountValue", stepCountValue);
      update();
    });
    update();
  }

  @override
  void onInit() {
    value = myServices.sharedPreferences.getInt("stepCountValue")!;
    startListening();
    startCalculatingSteps();
    super.onInit();
  }
}
