import 'package:be_healthy/controller/mydata_controller.dart';
import 'package:flutter/material.dart';

class CustomButtonData extends StatelessWidget {
  const CustomButtonData({
    super.key,
    required this.controller,
    required this.onPressed,
    required this.title,
  });

  final MyDataController controller;
  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: MaterialButton(
        minWidth: double.infinity,
        // padding: EdgeInsets.all(25),,
        padding: const EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: const Color(0xffC05DDA),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
