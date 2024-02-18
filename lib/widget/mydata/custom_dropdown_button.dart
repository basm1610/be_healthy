import 'package:be_healthy/controller/mydata_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownButton extends GetView<MyDataController> {
  const CustomDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDataController>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: Card(
                surfaceTintColor: Colors.transparent,
                elevation: 10,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15))),
                    hint: const Text(
                      'Choose physical activity',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    items: controller.items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ))
                        .toList(),
                    value: controller.selectedValue,
                    onChanged: (String? value) {
                      controller.changeDropDownButton(value);
                    },
                  ),
                ),
              ),
            ));
  }
}
