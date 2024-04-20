import 'package:be_healthy/controller/mydata_controller.dart';
import 'package:be_healthy/widget/mydata/custom_widget_age.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';

class CardAge extends StatelessWidget {
  const CardAge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<MyDataController>(
            builder: (controller) => Expanded(
                  child: Card(
                    surfaceTintColor: Colors.transparent,
                    elevation: 10,
                    margin: const EdgeInsets.all(15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                           Text(
                            "Age".tr,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomWidgetAge(
                                icon: Icons.add_outlined,
                                onTap: () {
                                  controller.add();
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${controller.number}",
                                style: const TextStyle(
                                    fontSize: 30,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CustomWidgetAge(
                                  onTap: () {
                                    controller.minus();
                                  },
                                  icon: Icons.remove_outlined)
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .07,
                          )
                        ]),
                  ),
                ))
      ],
    );
  }
}
