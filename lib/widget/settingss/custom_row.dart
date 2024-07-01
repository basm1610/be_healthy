import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRow extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool isDarkMood;
  final bool isLang;
  final void Function(bool)? onChanged;
  final bool? value;
  final void Function()? onPressedIcon;
  final Function(String)? onSelected;
  const CustomRow({
    super.key,
    required this.text,
    this.icon,
    this.isDarkMood = false,
    this.onChanged,
    this.value,
    this.onPressedIcon,
    this.isLang = false,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isDarkMood
          ? 10
          : isLang
              ? 5
              : 8),
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary
          //  Colors.white
          ,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text.tr, style: TextStyle(fontSize: 16)),
          isDarkMood
              ? Transform.scale(
                  scale: .9,
                  child: CupertinoSwitch(
                    value: value!,
                    onChanged: onChanged,
                    trackColor: Color(0xffEBE3DE),
                    activeColor: Color(0xff362C26),
                  ),
                  // 362c26
                )
              : isLang
                  ? PopupMenuButton(
                      icon: const Icon(Icons.keyboard_arrow_right_rounded),
                      // initialValue: "English",
                      onSelected: onSelected,
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            value: 'English'.tr,
                            child: Text("English".tr),
                          ),
                          PopupMenuItem(
                            value: 'Arabic'.tr,
                            child: Text("Arabic".tr),
                          ),
                        ];
                      },
                    )
                  : IconButton(
                      onPressed: onPressedIcon,
                      icon: Icon(icon),
                    ),
        ],
      ),
    );
  }
}
