import 'package:be_healthy/controller/auth/forgetpassword/verfiycode_controller.dart';
import 'package:be_healthy/widget/login/title_and_descreption_widget.dart';
import 'package:be_healthy/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';

class VerificationScreenRePassword extends StatelessWidget {
  const VerificationScreenRePassword({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(VerifyCodeController());

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Verification Code",
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: GetBuilder<VerifyCodeController>(builder: (controller)=>
          controller.isLoading ? const Center(child: CircularProgressIndicator()): 
          ListView(
            children: [
              const LogoWidget(),
              TitleAndDescriptionWidget(
                title: "Check Code",
                des: "Please Enter The Right Code Send To ${controller.email}",
              ),
              const SizedBox(height: 30),
              OtpTextField(
                autoFocus: true,
                numberOfFields: 6,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.goToResetPassword(verificationCode);
                }, // end onSubmit
              ),
            ],
          )),
        ));
  }
}
