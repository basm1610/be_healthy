// import 'package:be_healthy/controller/test/step_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pedometer/pedometer.dart';

// // ignore: must_be_immutable
// class StepsCount extends StatelessWidget {
//   StepsCount({super.key});

//   Pedometer pedometer = Pedometer();

//   // StepCount? stepCount;
//   @override
//   Widget build(BuildContext context) {
//     StepController controller = Get.put(StepController());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Step Counter'),
//       ),
//       body: GetBuilder<StepController>(
//           builder: (controller) => Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       'total Step Count: ${controller.totalCount}',
//                     ),
//                     Text(
//                       'Step Count:',
//                     ),
//                     Text(
//                       controller.stepCountValue.toString(),
//                       style: Theme.of(context).textTheme.headlineMedium,
//                     ),
//                     Divider(),
//                     Text(
//                       "${controller.value}",
//                       style: Theme.of(context).textTheme.headlineMedium,
//                     ),
//                   ],
//                 ),
//               )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:be_healthy/controller/test/step_controller.dart';

class StepssScreen extends StatelessWidget {
  const StepssScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StepsController controller = Get.put(StepsController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              'Today\'s Steps',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Obx(() => Text(
                  controller.todaySteps.value,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 50,
                    fontFamily: 'Bebas',
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
