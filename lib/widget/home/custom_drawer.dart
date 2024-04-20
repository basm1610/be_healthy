import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
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
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: AppColor.primaryColor),
              accountName: Text(
                "Basm Mohamed",
                style: TextStyle(fontSize: 14),
              ),
              accountEmail: Text("basm123@gmail.com"),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: AppColor.fourthColor,
                child: Text(
                  "B",
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ), //Text
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(' My Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text(' My Course '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.workspace_premium),
            title: const Text(' Go Premium '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.video_label),
            title: const Text(' Saved Videos '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text(' Edit Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
