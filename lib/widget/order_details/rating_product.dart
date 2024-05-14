import 'package:be_healthy/controller/order/order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingProduct extends StatelessWidget {
  final double initialRating;
  const RatingProduct({
    super.key,
    required this.controller, required this.initialRating,
  });

  final OrderDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RatingBar.builder(
        initialRating: initialRating,
        minRating: 1,
        itemSize: 40,
        direction: Axis.horizontal,
        allowHalfRating: true,
        // unratedColor: Colors.black,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star_rate,
          color: Color(0xffA013C3),
        ),
        onRatingUpdate: (rate) {
          // controller.ratting(rate);
        },
      ),
    );
  }
}
