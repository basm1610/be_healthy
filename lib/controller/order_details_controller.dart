import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  double rating = 2;
  int isSelected = 0;

  List<String> title = [
    "bad",
    "good",
    "very good",
    "amazing",
  ];
  List<IconData> iconFace = [
    FontAwesomeIcons.faceFrown,
    FontAwesomeIcons.faceSmileBeam,
    FontAwesomeIcons.faceGrin,
    FontAwesomeIcons.faceDizzy,
  ];

  selectedItems(int index) {
    isSelected = index;
    update();
  }

  void ratting(rate) {
    rating = rate;
    update();
  }
}
