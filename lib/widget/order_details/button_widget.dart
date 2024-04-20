import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';

class OrderDetailsButtonWidget extends StatelessWidget {
  final String name;
  final Color color;
  final void Function() onPressed;
  final bool isTrue;

  const OrderDetailsButtonWidget({
    super.key,
    required this.name,
    required this.color,
    required this.onPressed,
     required this.isTrue,
  });

  @override
  Widget build(BuildContext context) {
    // 15 10
    // 10 15
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isTrue? 15 :10, vertical: isTrue? 10 :15),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minWidth: double.maxFinite,
        color: color,
        splashColor: isTrue ? null :AppColor.primaryColor,
        padding: EdgeInsets.all(10),
        child: Text(
          name,
          style: TextStyle(
              color: Colors.white, fontSize: isTrue? 20:16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
