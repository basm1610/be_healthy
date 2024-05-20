import 'package:be_healthy/controller/home_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends GetView<HomeController> {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColor.primaryColor,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: AppColor.primaryColor),
              accountName: Text(
                "${controller.name}",
                style: const TextStyle(fontSize: 14),
              ),
              accountEmail: Text("${controller.email}"),
              currentAccountPictureSize: const Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: AppColor.fourthColor,
                child: Text(
                  "${controller.name}".substring(0, 1).toUpperCase(),
                  style: const TextStyle(fontSize: 30.0, color: Colors.white),
                ), //Text
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              ' My Profile ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            iconColor: AppColor.grey2,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            iconColor: AppColor.grey2,
            title: const Text(
              ' Favorite ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              controller.goToFavouriteScreen();
            },
          ),
          ListTile(
            leading: const Icon(Icons.workspace_premium),
            iconColor: AppColor.grey2,
            title: const Text(
              ' Popular ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              controller.goToPopularScreen();
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_support),
            iconColor: AppColor.grey2,
            title: const Text(
              ' Contact Us ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
            onTap: () {
              controller.goToContactUsScreen();
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            iconColor: AppColor.grey2,
            title: const Text(
              'LogOut',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              controller.logout();
            },
          ),
        ],
      ),
    );
  }
}
