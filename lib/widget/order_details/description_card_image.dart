import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';

class DescriptionOfCardImage extends StatelessWidget {
  final String name;
  const DescriptionOfCardImage({
    super.key, required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        name,
        style:
            const TextStyle(color: AppColor.thirdColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
