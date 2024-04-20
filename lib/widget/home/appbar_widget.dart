import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidgetHome extends StatelessWidget {
  final bool isHome ;
  final void Function()? onPressed;
  const AppBarWidgetHome({super.key,this.isHome = true, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isHome ?  IconButton(
          icon: const Icon(FontAwesomeIcons.barsStaggered),
          onPressed: onPressed,
          ):Container(),
        SizedBox(
            height: 50,
            width:isHome ? MediaQuery.of(context).size.width *  .75 :MediaQuery.of(context).size.width *   .92,
            child: TextField(
              cursorColor: AppColor.primaryColor,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: "Search",
                hintStyle: const TextStyle(color: AppColor.grey5),
                prefixIcon: const Icon(Icons.search, color: AppColor.grey5),
                filled: true,
                fillColor: AppColor.grey4,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
              ),
            ))
      ],
    );
  }
}
