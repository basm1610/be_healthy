import 'package:be_healthy/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    "TitleOnBoardingOne".tr,
    "assets/images/image4.png",
    "DescreptionOnBoardingOne".tr,
  ),
  OnBoardingModel(
    "TitleOnBoardingTwo".tr,
    "assets/images/image5.png",
    "DescreptionOnBoardingTwo".tr,
  ),
  OnBoardingModel(
    "TitleOnBoardingThree".tr,
    "assets/images/image7.png",
    "DescreptionOnBoardingThree".tr,
  ),
];

List<CardWorkoutModel> cardWorkoutList = [
  CardWorkoutModel(
      title: "Strength".tr,
      image: "assets/images/strength1.png",
      color: const Color(0xffC669DE)),
  CardWorkoutModel(
      title: "Stretching".tr,
      image: "assets/images/stretching.png",
      color: const Color(0xff8EE97F)),
  CardWorkoutModel(
      title: "Cardio".tr,
      image: "assets/images/cardio1.png",
      color: const Color(0xff696EF2)),
  CardWorkoutModel(
      title: "Yoga".tr,
      image: "assets/images/zomba.png",
      color: const Color(0xffECFF75)),
];
