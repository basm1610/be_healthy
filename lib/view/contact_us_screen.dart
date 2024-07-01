import 'package:be_healthy/controller/contact_us_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(ContactUsController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ContactUs".tr,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<ContactUsController>(
            builder: (controller) => SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        AppImageAsset.contactUsImage,
                        width: 170,
                        // fit: BoxFit.cover,
                      ),
                      Form(
                        key: controller.formState,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: controller.textFeedback,
                          maxLines: 6,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "PleaseAddYourFeedback".tr;
                            } else if (value.length <= 4) {
                              return "Yourfeedbacksmustbelongerthan4characters".tr;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "EnterYourFeedback".tr,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      const SizedBox(
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
                          "SendMessage".tr,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      Text(
                        "Connectwithus".tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        child: Divider(),
                      ),

                      ListTile(
                        onTap: () {
                          controller.openEmail();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        tileColor: const Color(0xff008E85),
                        iconColor: Colors.white,
                        title: Text(
                          "Email".tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                        subtitle: Text(
                          "BeHealthy@gmail.com",
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                        trailing: const Icon(Icons.email_outlined),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        onTap: () {
                          controller.goLaunchUrl();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        tileColor: const Color(0xff008E85),
                        iconColor: Colors.white,
                        title: Text(
                          "Phone".tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                        subtitle: Text(
                          "01050625339",
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                        trailing: const Icon(Icons.phone_android_outlined),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
