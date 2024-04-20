import 'package:be_healthy/controller/workout_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SectionFavourite extends StatelessWidget {
  const SectionFavourite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      // width: 250,
      child: GetBuilder<WorkoutController>(
          builder: (controller) => PageView.builder(
              padEnds: false,
              itemCount: controller.images.length,
              pageSnapping: true,
              controller: controller.pageController,
              onPageChanged: (page) {
                // setState(() {
                //   activePage = page;
                // });
              },
              itemBuilder: (context, pagePosition) {
                print(pagePosition);
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        controller.images[pagePosition],
                        fit: BoxFit.cover,
                        // width: 200,
                      ),
                    ),
                    Positioned(
                      right: 15,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {
                            controller.isFavourite();
                          },
                          child: FaIcon(
                            controller.isFav2
                                ? FontAwesomeIcons.heart
                                : FontAwesomeIcons.solidHeart,
                            color: AppColor.primaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 13.5,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        width:
                            MediaQuery.of(context).size.width * .77,
                        decoration: BoxDecoration(
                            color: Colors.black38.withOpacity(.3),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "back exercise",
                          style: (TextStyle(
                              fontWeight: FontWeight.w700,
                              // backgroundColor: Colors.black38
                              color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                );
              })),
    );
  }
}