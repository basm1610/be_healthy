import 'package:be_healthy/controller/signup_controller.dart';
import 'package:be_healthy/view/auth/login_screen.dart';
import 'package:be_healthy/widget/login/custom_button.dart';
import 'package:be_healthy/widget/login/custom_stack.dart';
import 'package:be_healthy/widget/login/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const CustomTextField(hintText: "Enter your Name"),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const CustomTextField(hintText: "Enter your Email"),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    "Phone Number",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const CustomTextField(
                      hintText: "Your phone number, e.g : +01 112 xxx xxx"),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GetBuilder<SignUpController>(
                    builder: (controller) => CustomTextField(
                      hintText: "Your password, at least 8 character.",
                      icon: controller.isPassword
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                      isPasswordFiled: true,
                      obscureText: controller.isPassword,
                      onPressed: () {
                        controller.obscurePassword();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    "Confirm Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GetBuilder<SignUpController>(
                    builder: (controller) => CustomTextField(
                      hintText: "Re-type your password",
                      icon: controller.isConfirmPassword
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                      isPasswordFiled: true,
                      obscureText: controller.isConfirmPassword,
                      onPressed: () {
                        controller.obscureConfirmPassword();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  CustomButton(text: "SignUp", onPressed: () {}),
                   const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don you have an account ?Login ",
                        style: TextStyle(fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => const LoginScreen());
                        },
                        child: const Text(
                          "here",
                          style: TextStyle(
                            color: Color(0xffB547D1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
               
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFC670DB),
      body: const CustomStackWidget(text: "SignUp"),
    );
  }
}
