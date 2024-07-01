import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String image;
  const CardImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.network(
          image,
          // "${AppLink.imageRestaurantFood}/${controller.restaurantModel.data?.image}"
          width: 250,
          height: 140,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
