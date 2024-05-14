import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final IconData? icon;
  final bool obscureText;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?) valid;
  final void Function()? onPressed;
  final TextEditingController? controller;
  const CustomTextField(
      {super.key,
      this.icon,
      this.obscureText = false,
      required this.hintText,
      this.onPressed,
      this.controller,
      this.keyboardType,
      required this.valid});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
       scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      keyboardType: keyboardType,
      controller: controller,
        autovalidateMode:
      AutovalidateMode.onUserInteraction,
      validator: valid,
      obscureText: obscureText == false ? false : true,
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
        suffixIcon: IconButton(
          color: const Color(0xffADADAD),
          onPressed: onPressed,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
