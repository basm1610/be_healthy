// import 'dart:async';
// import 'dart:developer';

// import 'package:be_healthy/controller/test/test_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';

// import '../../core/functions/check_internet.dart';

// class AudioScreen extends StatelessWidget {
//   const AudioScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final NetworkService networkService = Get.find<NetworkService>();
//     final CheckInternetController checkInternetController = Get.put(CheckInternetController());

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Connectivity Plus Example'),
//         elevation: 4,
//       ),
//       body:GetBuilder<CheckInternetController>(builder: (controller)=> Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Spacer(flex: 2),
//           Text(
//             'Active connection types:',
//             style: Theme.of(context).textTheme.headlineMedium,
//           ),
//           const Spacer(),
//           ListView(
//             shrinkWrap: true,
//             children: List.generate(
//                 controller.connectionStatus.length,
//                 (index) => Center(
//                       child: Text(
//                         controller.connectionStatus[index].toString(),
//                         style: Theme.of(context).textTheme.headlineSmall,
//                       ),
//                     )),
//           ),
//           const Spacer(flex: 2),
//           controller.connectionStatus.contains(ConnectivityResult.wifi)?
//           Text(controller.connectionStatus.toString()):Text("not conneted"),
//           SizedBox(
//             height: 25,
//           ),
//           // Text(checkInternets().toString()),
//           SizedBox(
//             height: 25,
//           ),
//         ],
//       )),
//     );
//   }
// }
