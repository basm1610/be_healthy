import 'package:be_healthy/controller/contact_us_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    ContactUsController controller = Get.put(ContactUsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text("Contact Us"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<ContactUsController>(
            builder: (controller) => SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Lottie.asset(AppImageAsset.contactUs, width: 200, height: 200),
                      Image.asset(
                        "${AppImageAsset.contactUsImage}",
                        width: 170,
                        // fit: BoxFit.cover,
                      ),
                      // const Center(
                      //   child: Text(
                      //     textAlign: TextAlign.center,
                      //     "Please give us your opinion about the application",
                      //     style: TextStyle(
                      //       fontSize: 25,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Form(
                        key: controller.formState,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: controller.textFeedback,
                          maxLines: 6,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please add your feedback";
                            } else if (value.length <= 4) {
                              return "you should your feedback greater then of 4";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Your Feedback",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        color: AppColor.primaryColor,
                        minWidth: MediaQuery.of(context).size.width * .55,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          controller.sendFeedback();
                        },
                        child: Text(
                          "Send Message",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      Text(
                        "Connect with us",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        child: Divider(),
                      ),

                      ListTile(
                        onTap: () {
                          controller.openEmail();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        tileColor: Color(0xff008E85),
                        iconColor: Colors.white,
                        title: Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                        subtitle: Text(
                          "BeHealthy@gmail.com",
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                        trailing: Icon(Icons.email_outlined),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        onTap: () {
                          controller.goLaunchUrl();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        tileColor: Color(0xff4F4350),
                        iconColor: Colors.white,
                        title: Text(
                          "Phone",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                        subtitle: Text(
                          "01050625339",
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                        trailing: Icon(Icons.phone_android_outlined),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
