import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/widget/login/custom_button.dart';
import 'package:be_healthy/widget/login/textfield_widget.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "My Account",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColor.primaryColor),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 55,
                backgroundColor: AppColor.fourthColor,
                child: Text(
                  "B",
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
              ),
            ),
            // Text(
            //   "basm",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            // ),
            // Text(
            //   "basm@gmail.com",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
            // ),
            // Divider(),
            TextFieldWidgetAuth(
                icon: Icons.person, hintText: "basm", label: "name"),
            TextFieldWidgetAuth(
                icon: Icons.email, hintText: "basm@gmail.com", label: "Email"),
            TextFieldWidgetAuth(
                icon: Icons.phone, hintText: "01050625339", label: "Phone"),

            CustomButton(
              text: "Update",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
