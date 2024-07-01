import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Cario",
    colorScheme: const ColorScheme.light(
        primary: AppColor.primaryColor,
        onSecondary: Colors.black,
        onSurface: Color(0xff6A6A6A),
        onBackground: Color(0xffEBE3DE),
        secondary: Colors.white,
        // surface: AppColor.grey4,
        onPrimary: AppColor.grey4,
        background: Colors.white));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        primary: Colors.grey.shade700,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Color(0xff423e3b),
        secondary: Color(0xff524c49),
        // surface: Colors.black26,
        onPrimary: Colors.black26,
        background: Colors.black));
