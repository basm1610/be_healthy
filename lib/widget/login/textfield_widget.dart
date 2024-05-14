import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidgetAuth extends StatelessWidget {
  String hintText;
  String label;
  IconData icon;
  bool obscureText;
  final TextEditingController? controller;
  String? Function(String?)? valid ;
  TextInputType? keyboardType ;
  void Function()? onTapIcon;

   TextFieldWidgetAuth({
    super.key,
    this.onTapIcon,
    required this.icon,
    required this.hintText,
    required this.label,
    this.controller,
    this.obscureText = false,
     this.valid,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: keyboardType ,
        validator: valid,
        // ignore: unnecessary_null_comparison
        obscureText: obscureText==null ||obscureText == false ?false : true,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 12,),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(label),
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          suffixIcon: InkWell(onTap: onTapIcon ,child: Icon(icon),),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),

        ),
      ),
    );
  }
}
