import 'package:be_healthy/controller/auth/forgetpassword/forget_password_controller.dart';
import 'package:be_healthy/core/functions/input_validate.dart';
import 'package:be_healthy/widget/login/custom_button.dart';
import 'package:be_healthy/widget/login/custom_textfield.dart';
import 'package:be_healthy/widget/login/title_and_descreption_widget.dart';
import 'package:be_healthy/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forget Password",
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              // logo image
              const LogoWidget(),
              // SizedBox(
              //   height: 40,
              // ),
              // const LogoWidget(),
              // description
              TitleAndDescriptionWidget(
                title: "Check Your Email",
                des: "",
              ),
              // const SizedBox(height: 30),
              // email filed
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                valid: (val) {
                  return validInput(val!, 5, 100, "email");
                },
                controller: controller.email,
                icon: Icons.email_outlined,
                hintText: "Enter Your Email",
              ),
              const SizedBox(
                height: 25,
              ),
              // Button check
              GetBuilder<ForgetPasswordController>(
                  builder: (controller) => controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          text: "check",
                          onPressed: () {
                            controller.checkEmail();
                          }))
            ],
          ),
        ),
      ),
    );
  }
}
