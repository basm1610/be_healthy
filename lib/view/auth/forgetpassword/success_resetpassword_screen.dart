import 'package:be_healthy/controller/auth/forgetpassword/success_resetpassword_controller.dart';
import 'package:be_healthy/widget/login/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessResetPasswordScreen extends StatelessWidget {
  const SuccessResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordController controller =
        Get.put(SuccessResetPasswordController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Success Reset Password",
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 150),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset("assets/lotties/success.json",
                  width: 200, height: 200),
              Text(
                "Success",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 50),
              ),
              CustomButton(
                  text: "Go To Login",
                  onPressed: () {
                    controller.goToLogin();
                  }),
            ],
          )
        ],
      ),
    );
  }
}
