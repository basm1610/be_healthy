import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String number;
  final IconData icon;
  final String description;
  final double percent;
  final double angle;
  final Color color;
  const CardWidget(
      {super.key,
      required this.title,
      required this.number,
      required this.icon,
      required this.description,
      required this.color,
      required this.percent,
      required this.angle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        surfaceTintColor: Colors.transparent,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Transform.rotate(
                    angle: angle,
                    child: Icon(
                      icon,
                      color: color,
                      size: 30,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  number,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Text(
              description,
              style: const TextStyle(color: Color(0xff646363)),
            ),
            const SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width - 60,
              barRadius: const Radius.circular(10),
              lineHeight: 8.0,
              percent: percent,
              progressColor: color,
              backgroundColor: const Color(0xffD9D9D9),
            ),
            const SizedBox(
              height: 5,
            ),
          ]),
        ),
      ),
    );
  }
}
