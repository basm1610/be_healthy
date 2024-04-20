import 'package:flutter/material.dart';

class CardCaloriesHome extends StatelessWidget {
  final void Function()? onTap;
  const CardCaloriesHome({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 1.5,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        title: const Text("you can track your data here",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
        subtitle: const Text(
          "your calories,steps,water",
          style: TextStyle(color: Color(0xff6B7280), fontSize: 12),
        ),
        trailing: const Text(
          "See All >",
          style: TextStyle(color: Color(0xff6B7280)),
        ),
      ),
    );
  }
}
