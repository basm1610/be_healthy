import 'package:be_healthy/controller/login_controller.dart';
import 'package:be_healthy/view/auth/signup_screen.dart';
import 'package:be_healthy/widget/login/custom_button.dart';
import 'package:be_healthy/widget/login/custom_stack.dart';
import 'package:be_healthy/widget/login/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<LoginController>(builder: (controller){
        return  Container(
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
                    "Email",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                   CustomTextField(hintText: "Enter your Email",controller: controller.username),
                  const SizedBox(
                    height: 36,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CustomTextField(
                      controller: controller.password,
                      hintText: "Enter your password",
                      icon: controller.isHiddenn
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                      isPasswordFiled: true,
                      obscureText: controller.isHiddenn,
                      onPressed: () {
                        controller.obscurePassword();
                      },
                    ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(color: Color(0xffADADAD), fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  GetBuilder<LoginController>(builder: (controller) {
                    return CustomButton(
                        text: "Login",
                        onPressed: () {
                          
                        });
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account yet?Register ",
                        style: TextStyle(fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SignUpScreen());
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
                  const SizedBox(
                    height: 29,
                  ),
                  const Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: Color(0xffADADAD),
                      )),
                      Text(
                        "   Or login with   ",
                        style: TextStyle(color: Color(0xff707070)),
                      ),
                      Expanded(
                          child: Divider(
                        color: Color(0xffADADAD),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/images/Google.png"),
                        // child: Image.asset("images/Google.png"),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            AssetImage("assets/images/facebook.png"),
                        // child: Image.asset("images/Google.png"),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
      }),
      backgroundColor: const Color(0xFFC670DB),
      body: const CustomStackWidget(text: "Login"),
    );
  }
}
