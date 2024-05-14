import 'package:be_healthy/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:be_healthy/core/functions/input_validate.dart';
import 'package:be_healthy/widget/login/custom_button.dart';
import 'package:be_healthy/widget/login/custom_textfield.dart';
import 'package:be_healthy/widget/login/title_and_descreption_widget.dart';
import 'package:be_healthy/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Reset password",
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: GetBuilder<ResetPasswordController>(
              builder: (controller) => controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Form(
                      key: controller.formState,
                      child: ListView(
                        children: [
                          const LogoWidget(),
                          TitleAndDescriptionWidget(
                            title: "NewPassword".tr,
                            des: "PleaseEnterNewPassword".tr,
                          ),
                          const SizedBox(height: 30),
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
                            height: 25,
                          ),
                          Text(
                            "RepeatPassword".tr,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          CustomTextField(
                            hintText: "HintNewPassword".tr,
                            icon: controller.isConfirmPassword
                                ? Icons.remove_red_eye
                                : Icons.visibility_off,
                            obscureText: controller.isConfirmPassword,
                            onPressed: () {
                              controller.obscureConfirmPassword();
                            },
                            controller: controller.rePassword,
                            valid: (val) {
                              return validInput(val!, 6, 15, "password");
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          CustomButton(
                              text: "Save".tr,
                              onPressed: () {
                                controller.goToSuccessResetPassword();
                              }),
                        ],
                      ),
                    )),
        ));
  }
}
