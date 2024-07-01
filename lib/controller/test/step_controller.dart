// import 'package:be_healthy/core/services/myservices.dart';
// import 'package:get/get.dart';
// import 'package:pedometer/pedometer.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class StepController extends GetxController {
//   // late Stream<StepCount> stepCountStream;
//   // MyServices myServices = Get.find();
//   // Pedometer pedometer = Pedometer();
//   // int stepCountValue = 0;
//   // String totalCount = "0";
//   // var initialSteps = 0;
//   // late int value  ;
//   // void startListening() {
//   //   pedometer = Pedometer();
//   //   // firstSteps = Pedometer.stepCountStream.firstWhere((element) => false);
//   //   Pedometer.stepCountStream.listen((StepCount event) {
//   //     totalCount = '${event.steps}';
//   //     update();
//   //   });
//   // }

//   // void startCalculatingSteps() {
//   //   Pedometer.stepCountStream.listen((StepCount event) {
//   //     if (initialSteps == 0) {
//   //       initialSteps = event.steps;
//   //     }
//   //     int stepsFromNow = event.steps - initialSteps;
//   //      stepCountValue = stepsFromNow;
//   //     saveStepCountValue(stepCountValue);
//   //     update();
//   //   });
//   //   update();
//   // }

//   // void saveStepCountValue(int stepCountValue) {
//   //   myServices.sharedPreferences.setInt("stepCountValue", stepCountValue);
//   // }

//   // int getSavedStepCountValue() {
//   //   return myServices.sharedPreferences.getInt("stepCountValue") ?? 0;
//   // }

//   // @override
//   // void onInit() {
//   //  value = getSavedStepCountValue();
//   //   initialSteps = value;
//   //   startListening();
//   //   startCalculatingSteps();
//   //   super.onInit();
//   // }

//   Stream<StepCount>? _stepCountStream;
//   late String todaySteps = '0', _savedSteps;
//   int? lastDay = 0;
//   late int _currentDay;
//   MyServices myServices = Get.find();

//   loadData() async {
//     // final SharedPreferences prefs = await _prefs;
//     _currentDay =
//         myServices.sharedPreferences.getInt("currentDay") ?? DateTime.now().day;
//     todaySteps = myServices.sharedPreferences.getString("todaySteps") ?? '0';
//     // print("today steps from shared preferences : " + todaySteps);
//     // print("current day from shared preferences : " + _currentDay.toString());
//   }

//   @override
//   void onInit() {
//     loadData();
//     initPlatformState();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     myServices.prefs.then((SharedPreferences) {
//       myServices.sharedPreferences.setString("todaySteps", todaySteps);
//       myServices.sharedPreferences.setInt("currentDay", _currentDay);
//     });
//     // TODO: implement dispose
//     super.dispose();
//   }

//   Future<void> onStepCount(StepCount event) async {
//     // final SharedPreferences prefs = await _prefs;
//     _savedSteps = myServices.sharedPreferences.getString("savedSteps") ??
//         event.steps.toString();
//     myServices.sharedPreferences.setString("savedSteps", _savedSteps);

//     _currentDay = DateTime.now().day;
//     lastDay = myServices.sharedPreferences.getInt("lastDay") ?? _currentDay;
//     myServices.sharedPreferences.setInt("lastDay", lastDay!);
//     if (_currentDay != lastDay) {
//       lastDay = _currentDay;
//       _savedSteps = event.steps.toString();
//       todaySteps = '0';
//       myServices.sharedPreferences.setInt('lastDay', lastDay!);
//       myServices.sharedPreferences.setString('savedSteps', _savedSteps);
//       myServices.sharedPreferences.setString('todaySteps', todaySteps);
//     }

//     todaySteps = (event.steps - int.parse(_savedSteps)).toString();
//     update();
//   }

//   void onStepCountError(error) {
//     todaySteps = 'Step Count not available';
//     update();
//   }

//   void initPlatformState() async {
//     if (await Permission.activityRecognition.request().isGranted) {
//       _stepCountStream = Pedometer.stepCountStream;

//       _stepCountStream!.listen(onStepCount).onError(onStepCountError);

//       // Either the permission was already granted before or the user just granted it.
//     }

//     // if (!mounted) return;
//   }
// }

import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

class StepsController extends GetxController {
  var todaySteps = '0'.obs;
  var savedSteps = ''.obs;
  var currentDay = 0.obs;
  var lastDay = 0.obs;

  Stream<StepCount>? stepCountStream;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    super.onInit();
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
}
