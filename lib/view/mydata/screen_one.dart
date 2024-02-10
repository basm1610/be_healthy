import 'package:be_healthy/controller/test.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(testController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    child: Icon(Icons.male, size: 80),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    child: Icon(Icons.female, size: 80),
                  ),
                ),
              ],
            ),
            Card(
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                const Text("Height"),
                Container(
                  child: WheelChooser.integer(
                    listWidth: 100.0,
                    onValueChanged: (weight) {},
                    maxValue: 200,
                    minValue: 1,
                    initValue: 90,
                    horizontal: true,
                    selectTextStyle: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    unSelectTextStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ]),
            ),
            Row(
              children: [
                Container(
                  width: 150,
                  child: Card(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Column(
                          children: [
                            const Text("Weight"),
                            WheelChooser.integer(
                              listWidth: 100.0,
                              onValueChanged: (weight) {},
                              maxValue: 200,
                              minValue: 1,
                              initValue: 90,
                              horizontal: true,
                              selectTextStyle: const TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              unSelectTextStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                GetBuilder<testController>(
                    builder: (controller) => Card(
                          margin: EdgeInsets.all(15),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Column(children: [
                              Text("Age"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.add();
                                    },
                                    child: CircleAvatar(
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("${controller.number}"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.minus();
                                    },
                                    child: CircleAvatar(
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                          ),
                        ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
