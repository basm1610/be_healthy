import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final IconData? icon;
  final bool obscureText;
  final String hintText;
  final void Function()? onPressed;
  final bool isPasswordFiled;
  final TextEditingController? controller;
  const CustomTextField(
      {super.key,
      this.icon,
      this.obscureText = false,
      required this.hintText,
      this.onPressed,
      this.isPasswordFiled = false, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.quicksand(
          fontSize: 15,
          color: const Color(0xffADADAD),
        ),
        //  TextStyle(
        //   fontSize: 15,
        //   color: Color(0xffADADAD),
        // ),
        suffixIcon: isPasswordFiled == true
            ? IconButton(
                color: const Color(0xffADADAD),
                onPressed: onPressed,
                icon: Icon(icon),
              )
            : null,
      ),
    );
  }
}
