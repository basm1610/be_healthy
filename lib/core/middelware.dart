
import 'package:be_healthy/core/constant/routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:be_healthy/core/services/myservices.dart';

class MyMiddleWare extends GetMiddleware{
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
  // if(myServices.sharedPreferences.getString("step")=="2"){
  //   return const RouteSettings(name: AppRouts.home);
  // }
  if(myServices.sharedPreferences.getString("step")=="1"){
    return const RouteSettings(name: AppRouts.login);
  }if(myServices.sharedPreferences.getString("step")=="2"){
    return const RouteSettings(name: AppRouts.home);
  }
  return null;

  }


}