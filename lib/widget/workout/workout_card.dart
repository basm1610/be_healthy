import 'package:flutter/material.dart';

class WorkOutCard extends StatelessWidget {
  final void Function()? onTap;
  final String assetName;
  final String title;
  final Color color;
  const WorkOutCard({
    super.key,
    this.onTap,
    required this.assetName,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        surfaceTintColor: Colors.transparent,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                assetName,
                width: 80,
                height: 50,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
