import 'package:flutter/material.dart';

class OnBoardingModel{
  final String? title;
  final String? image;
  final String? description;

  OnBoardingModel(this.title, this.image, this.description);
}


class CardWorkoutModel{
  final String? title;
  final String? image;
  final Color color;

  CardWorkoutModel({this.title, this.image, required this.color});
}