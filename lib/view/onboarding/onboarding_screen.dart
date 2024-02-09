import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:get/get.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:rulers/rulers.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    num getValue = 0;
    List<RulerRange> ranges = const [
      RulerRange(begin: 0, end: 10, scale: 0.1),
      RulerRange(begin: 10, end: 100, scale: 1),
      RulerRange(begin: 100, end: 1000, scale: 10),
      RulerRange(begin: 1000, end: 10000, scale: 100),
      RulerRange(begin: 10000, end: 100000, scale: 1000)
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [
            Container(
              // margin: const EdgeInsets.only(top: 8.0),
              child: RulerPicker(
                // controller: _rulerPickerController!,
                onBuildRulerScaleText: (index, value) {
                  return value.toInt().toString();
                },
                ranges: ranges,

                scaleLineStyleList: const [
                  ScaleLineStyle(
                      color: Colors.grey, width: 1.5, height: 30, scale: 0),
                  ScaleLineStyle(
                      color: Colors.grey, width: 1, height: 25, scale: 5),
                  ScaleLineStyle(
                      color: Colors.grey, width: 1, height: 15, scale: -1)
                ],

                onValueChanged: (value) {
                  log("value:$value");
                  setState(() {
                    getValue = value;
                  });
                  print(getValue);
                },
                width: MediaQuery.of(context).size.width,
                height: 80,
                rulerMarginTop: 8,
                // marker: Container(
                //     width: 8,
                //     height: 50,
                //     decoration: BoxDecoration(
                //         color: Colors.red.withAlpha(100),
                //         borderRadius: BorderRadius.circular(5))),
              ),
            ),
          ],
        ));
  }
}
