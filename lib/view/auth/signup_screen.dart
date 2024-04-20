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
                   Text(
                    "Name".tr,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                   CustomTextField(hintText: "HintTextName".tr),
                  const SizedBox(
                    height: 36,
                  ),
                   Text(
                    "Email".tr,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                   CustomTextField(hintText: "HintTextEmail".tr),
                  const SizedBox(
                    height: 36,
                  ),
                   Text(
                    "Phone".tr,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                   CustomTextField(
                      hintText: "HintTextPhone".tr),
                  const SizedBox(
                    height: 36,
                  ),
                   Text(
                    "Password".tr,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GetBuilder<SignUpController>(
                    builder: (controller) => CustomTextField(
                      hintText: "HintTextPassword".tr,
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
                   Text(
                    "ConfirmPassword".tr,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GetBuilder<SignUpController>(
                    builder: (controller) => CustomTextField(
                      hintText: "HintTextConfirmPassword".tr,
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
                       Text(
                        "TextUnderButtonSignUp".tr,
                        style: const TextStyle(fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => const LoginScreen());
                        },
                        child:  Text(
                          "Here".tr,
                          style: const TextStyle(
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
