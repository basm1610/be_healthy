import 'package:flutter/material.dart';

class CustomWidgetAge extends StatelessWidget {
  final void Function()? onTap;
  final IconData? icon;
  const CustomWidgetAge({
    super.key,
    required this.onTap,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          // width: 30,
          // height: 30,
          child:  Icon(
            color: const Color(0xff716E6E),
           icon,
            size: 40,
          )),
    );
  }
}
