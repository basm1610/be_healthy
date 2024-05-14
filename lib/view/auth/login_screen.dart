import 'package:be_healthy/controller/auth/login_controller.dart';
import 'package:be_healthy/core/functions/input_validate.dart';
import 'package:be_healthy/view/auth/signup_screen.dart';
import 'package:be_healthy/widget/login/custom_button.dart';
import 'package:be_healthy/widget/login/custom_stack.dart';
import 'package:be_healthy/widget/login/custom_textfield.dart';
import 'package:be_healthy/widget/login/login_with_social.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<LoginController>(builder: (controller) {
        return Container(
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
                        "Email".tr,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      CustomTextField(
                        controller: controller.email,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "HintTextEmail".tr,
                        //  controller: controller.username
                        valid: (val) {
                          return validInput(val!, 10, 50, "email");
                        },
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      Text(
                        "Password".tr,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      CustomTextField(
                        controller: controller.password,
                        valid: (val) {
                          return validInput(val!, 6, 50, "password");
                        },
                        // controller: controller.password,
                        hintText: "HintTextPassword".tr,
                        icon: controller.isHiddenn
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        obscureText: controller.isHiddenn,
                        onPressed: () {
                          controller.obscurePassword();
                        },
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: Text(
                            "ForgetPassword".tr,
                            style: const TextStyle(
                                color: Color(0xffADADAD), fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      GetBuilder<LoginController>(builder: (controller) {
                        return controller.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomButton(
                                text: "Login".tr,
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
                            "TextUnderButtonLogin".tr,
                            style: const TextStyle(fontSize: 12),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SignUpScreen());
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
                      const SizedBox(
                        height: 29,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: Divider(
                            color: Color(0xffADADAD),
                          )),
                          Text(
                            "CompleteTextUnderButtonLogin".tr,
                            style: const TextStyle(color: Color(0xff707070)),
                          ),
                          const Expanded(
                              child: Divider(
                            color: Color(0xffADADAD),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const LoginWithSocial()
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      backgroundColor: const Color(0xFFC670DB),
      body: CustomStackWidget(text: "Login".tr),
    );
  }
}
