import 'package:be_healthy/controller/auth/signup_controller.dart';
import 'package:be_healthy/core/functions/input_validate.dart';
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
      bottomNavigationBar: GetBuilder<SignUpController>(
          builder: (controller) => Container(
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
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name".tr,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            CustomTextField(
                              hintText: "HintTextName".tr,
                              icon: Icons.person,
                              controller: controller.userName,
                              valid: (value) {
                                return validInput(value!, 4, 10, "username");
                              },
                            ),
                            const SizedBox(
                              height: 36,
                            ),
                            Text(
                              "Email".tr,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            CustomTextField(
                              hintText: "HintTextEmail".tr,
                              controller: controller.email,
                              keyboardType: TextInputType.emailAddress,
                              icon: Icons.email,
                              valid: (val) {
                                return validInput(val!, 5, 50, "email");
                              },
                            ),
                            const SizedBox(
                              height: 36,
                            ),
                            Text(
                              "Phone".tr,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            CustomTextField(
                                hintText: "HintTextPhone".tr,
                                controller: controller.phone,
                                icon: Icons.phone,
                                valid: (val) {
                                  return validInput(val!, 10, 11, "phone");
                                }),
                            const SizedBox(
                              height: 36,
                            ),
                            Text(
                              "Password".tr,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            CustomTextField(
                              hintText: "HintTextPassword".tr,
                              icon: controller.isPassword
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                              obscureText: controller.isPassword,
                              onPressed: () {
                                controller.obscurePassword();
                              },
                              controller: controller.password,
                              valid: (val) {
                                return validInput(val!, 6, 15, "password");
                              },
                            ),
                            const SizedBox(
                              height: 36,
                            ),
                            Text(
                              "ConfirmPassword".tr,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            CustomTextField(
                              hintText: "HintTextConfirmPassword".tr,
                              icon: controller.isConfirmPassword
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                              obscureText: controller.isConfirmPassword,
                              onPressed: () {
                                controller.obscureConfirmPassword();
                              },
                              controller: controller.confirmPassword,
                              valid: (val) {
                                return validInput(val!, 6, 15, "password");
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            GetBuilder<SignUpController>(builder: (controller) {
                              return controller.isLoading
                                  ? const Center(child: CircularProgressIndicator())
                                  : CustomButton(
                                      text: "Signup".tr,
                                      onPressed: () {
                                        // Get.to(()=>MainHomeScreen());
                                        controller.sendPostRequest();
                                      });
                            }),
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
                                  child: Text(
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
              )),
      backgroundColor: const Color(0xFFC670DB),
      body: const CustomStackWidget(text: "SignUp"),
    );
  }
}
