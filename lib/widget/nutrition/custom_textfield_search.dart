import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextFieldSearch extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? mycontroller;
  const CustomTextFieldSearch(
      {super.key,
      required this.titleappbar,
      this.onPressedSearch,
      this.onChanged,
      this.mycontroller,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          textInputAction: TextInputAction.search,
          // autofocus: true,
          onFieldSubmitted: onFieldSubmitted,
          controller: mycontroller,
          onChanged: onChanged,
          decoration: InputDecoration(
              suffixIconColor: AppColor.primaryColor,
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: onPressedSearch,
              ),
              // prefixIcon: IconButton(
              //     icon: Icon(Icons.search), onPressed: onPressedSearch),
              hintText: titleappbar,
              hintStyle: const TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[200]),
        )),
      ]),
    );
  }
}
