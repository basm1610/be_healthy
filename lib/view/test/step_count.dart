import 'package:be_healthy/controller/test/step_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';

// ignore: must_be_immutable
class StepsCount extends StatelessWidget {
  StepsCount({super.key});

  Pedometer pedometer = Pedometer();

  // StepCount? stepCount;
  @override
  Widget build(BuildContext context) {
    StepController controller = Get.put(StepController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Step Counter'),
      ),
      body: GetBuilder<StepController>(builder: (controller)=>Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'total Step Count: ${controller.totalCount}',
            ),
            Text(
              'Step Count:',
            ),
            Text(
              controller.stepCountValue.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      )),
    );
  }
}
