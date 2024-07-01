import 'dart:developer';

import 'package:be_healthy/controller/account_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/core/functions/input_validate.dart';
import 'package:be_healthy/widget/login/custom_button.dart';
import 'package:be_healthy/widget/login/custom_textfield.dart';
import 'package:be_healthy/widget/login/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController controller = Get.put(AccountController());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "MyAccount".tr,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColor.primaryColor),
      body: GetBuilder<AccountController>(
          builder: (controller) => controller.isLoading
              ? Center(
                  heightFactor: 2.5,
                  child: Lottie.asset("assets/lotties/loading.json",
                      width: 200, height: 200),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: controller.formState,
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
                              "${controller.userModel.data?.name}"
                                  .substring(0, 1)
                                  .toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 60, color: Colors.white),
                            ),
                          ),
                        ),

                        Text(
                          "${controller.userModel.data?.email}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Divider(),
                        TextFieldWidgetAuth(
                            controller: controller.namee,
                            icon: Icons.person,
                            hintText: "${controller.userModel.data?.name}",
                            label: "Name".tr),
                        // TextFieldWidgetAuth(
                        //     controller: controller.emaill,
                        //     icon: Icons.email,
                        //     hintText: controller.email,
                        //     label: "Email".tr),
                        TextFieldWidgetAuth(
                            controller: controller.phonee,
                            keyboardType: TextInputType.phone,
                            icon: Icons.phone,
                            hintText: "${controller.userModel.data?.phone}",
                            label: "Phonee".tr),

                        controller.isLoading
                            ? CircularProgressIndicator()
                            : CustomButton(
                                text: "Update".tr,
                                onPressed: () {
                                  controller.updateUser();
                                },
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ifYouWantChangePasswordClick".tr,
                              style: const TextStyle(fontSize: 12),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.defaultDialog(
                                    title: "ChangeYourPassword".tr,
                                    middleText: "",
                                    textConfirm: "Update".tr,
                                    cancelTextColor: AppColor.primaryColor,
                                    confirmTextColor: Colors.white,
                                    buttonColor: AppColor.primaryColor,
                                    textCancel: "Cancel".tr,
                                    onConfirm: () {
                                      controller.updateUserPassword();
                                    },
                                    actions: [
                                      GetBuilder<AccountController>(builder: (controller)=>TextFieldWidgetAuth(
                                        // color: Colors.black,
                                        hintText: "EnterYourCurrentPassword".tr,
                                        // icon: controller.isPassword
                                        //     ? Icons.remove_red_eye
                                        //     : Icons.visibility_off,
                                        obscureText:
                                            controller.isCurrentPassword,
                                        onTapIcon: () {
                                          controller.obscureCurrentPassword();
                                        },
                                        controller: controller.currentPass,
                                        valid: (val) {
                                          return validInput(
                                              val!, 6, 15, "password");
                                        },
                                        icon: controller.isCurrentPassword
                                            ? Icons.remove_red_eye
                                            : Icons.visibility_off,
                                        label: 'CurrentPassword'.tr,
                                      )),
                                      GetBuilder<AccountController>(builder: (controller)=>TextFieldWidgetAuth(
                                        icon: controller.isNewPassword
                                            ? Icons.remove_red_eye
                                            : Icons.visibility_off,
                                        label: 'NewPassword'.tr,
                                        hintText: "HintNewPassword".tr,
                                        // icon: controller.isPassword
                                        //     ? Icons.remove_red_eye
                                        //     : Icons.visibility_off,
                                        obscureText: controller.isNewPassword,
                                        onTapIcon: () {
                                          controller.obscurePassword();
                                        },
                                        controller: controller.newPass,
                                        valid: (val) {
                                          return validInput(
                                              val!, 6, 15, "password");
                                        },
                                      )),
                                      GetBuilder<AccountController>(builder: (controller)=>TextFieldWidgetAuth(
                                        icon: controller.isConfirmPassword
                                            ? Icons.remove_red_eye
                                            : Icons.visibility_off,
                                        label: 'ConfirmNewPassword'.tr,

                                        hintText: "EnterYourConfirmPassword".tr,
                                        // icon: controller.isConfirmPassword
                                        //     ? Icons.remove_red_eye
                                        //     : Icons.visibility_off,
                                        obscureText:
                                            controller.isConfirmPassword,
                                        onTapIcon: () {
                                          controller.obscureConfirmPassword();
                                        },
                                        controller: controller.confirmPass,
                                        valid: (val) {
                                          return validInput(
                                              val!, 6, 15, "password");
                                        },
                                      )),
                                    ]);
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
                        )
                      ],
                    ),
                  ),
                )),
    );
  }
}
