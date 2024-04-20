import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';

class StrengthScreen extends StatelessWidget {
  const StrengthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            // padding: EdgeInsets.zero,
            // isScrollable: true1
            // indicatorWeight: 50,
            labelColor: Colors.black,

            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),

            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5), // Creates border
                color: AppColor.fourthColor),
            tabs: const [
              Tab(text: "beginner"),
              Tab(text: "middle"),
              Tab(text: "advanced"),
            ],
          ),
          title: const Text(
            "Strength training",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                "Beginner",
                style: TextStyle(fontSize: 50),
              ),
            ),
            Center(
              child: Text(
                "Middle",
                style: TextStyle(fontSize: 50),
              ),
            ),
            Center(
              child: Text(
                "Advanced",
                style: TextStyle(fontSize: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
