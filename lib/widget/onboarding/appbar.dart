import 'package:be_healthy/widget/onboarding/large-text-icon.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          Positioned(
            top: -112,
            // left: 5,
            // bottom: 0,
            child: Container(
              height: 450,
              width: 450,
              // width: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      const Color(0xffB85EFF),
                      const Color(0xffD3A4F8).withOpacity(.0)
                    ]),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const Positioned(
              bottom: 130,
              // top: 50,
              child: LargeTextAndIcon()),
        ],
      ),
    );
  }
}
