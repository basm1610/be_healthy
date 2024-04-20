import 'package:flutter/material.dart';

class LoginWithSocial extends StatelessWidget {
  const LoginWithSocial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.transparent,
          backgroundImage:
              AssetImage("assets/images/Google.png"),
          // child: Image.asset("images/Google.png"),
        ),
        SizedBox(
          width: 40,
        ),
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.transparent,
          backgroundImage:
              AssetImage("assets/images/facebook.png"),
          // child: Image.asset("images/Google.png"),
        ),
      ],
    );
  }
}
