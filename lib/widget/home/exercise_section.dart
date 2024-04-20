import 'package:be_healthy/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseSection extends StatelessWidget {
  const ExerciseSection({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return  Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.goToWorkOutScreen();
                    },
                    child: const Card(
                      color: Color(0xFFC05DDA),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5, vertical: 25),
                        child: Center(
                            child: Text(
                          "all\nexercise",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 110,
                    width: MediaQuery.of(context).size.width * .77,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                controller.imagesGym[index],
                                // height: 70,
                                width: 54.04,
                                fit: BoxFit.fitWidth,
                              ),
                            )),
                  ),
                ],
              );
  }
}