import 'package:be_healthy/controller/order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingProduct extends StatelessWidget {
  const RatingProduct({
    super.key,
    required this.controller,
  });

  final OrderDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RatingBar.builder(
        initialRating: controller.rating,
        minRating: 1,
        itemSize: 40,
        direction: Axis.horizontal,
        allowHalfRating: true,
        // unratedColor: Colors.black,
        itemCount: 4,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star_rate,
          color: Color(0xffA013C3),
        ),
        onRatingUpdate: (rate) {
          controller.ratting(rate);
        },
      ),
    );
  }
}