import 'package:flutter/material.dart';

class WidgetNew extends StatelessWidget {
  const WidgetNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // color: Color(0xffF1BAFF),
          height: 200,
        ),
        Center(
          child: CircleAvatar(
              radius: 150, child: Image.asset("assets/images/image4.png")),
        )
      ],
    );
  }
}
