import 'package:be_healthy/widget/calories/card_calories.dart';
import 'package:be_healthy/widget/calories/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CaloriesScreen extends StatelessWidget {
  const CaloriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " Plan",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            CardCalories(),
            CardWidget(
              angle: 270 * 3.141592653589793 / 180,
              title: "Steps",
              number: '1,400',
              icon: FontAwesomeIcons.shoePrints,
              description: "goal 10,000 steps",
              color: Color(0xffF589D7),
              percent: .4,
            ),
            CardWidget(
              angle: 360 * 3.141592653589793 / 180,
              title: "Water",
              number: "500",
              icon: Icons.water_drop,
              description: "goal 2000 ml",
              color: Color(0xff65ACE0),
              percent: .8,
            )
          ],
        ),
      ),
    );
  }
}
