import 'package:be_healthy/controller/order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardRating extends GetView<OrderDetailsController> {
  final String title;
  final IconData iconFace;
  final IconData iconRate;
  final int count;
  final void Function()? onTap;
  final Color color ;
  final Color colorText ;
  final Color colorIcon ;
  final Color colorIconRate ;

  const CardRating({
    super.key,
    required this.title,
    required this.iconFace,
    required this.iconRate,
    required this.count,
     this.onTap, required this.color,
     required this.colorIcon,
     required this.colorText,
     required this.colorIconRate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 165,
        padding: EdgeInsets.all(5),
        // color: Colors.amber,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xffB2ADAD), width: .8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:  TextStyle(
                  color:  colorText,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(iconFace ,color: colorIcon,),
                // RatingBar.builder(
                //   initialRating: 0,
                //   itemSize: 20,
                //   minRating: 1,
                //   direction: Axis.horizontal,
                //   allowHalfRating: true,
                //   itemCount: count,
                //   itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                //   itemBuilder: (context, _) => Icon(
                //     Icons.star,
                //     color: Color(0xff57046B),
                //   ),
                //   onRatingUpdate: (rating) {
                //     print(rating);
                //   },
                // )
               Wrap(
                children: [
                  ...List.generate(count, (index) => Icon(Icons.star,color: colorIconRate,))
                ],
               )
              ],
            )
          ],
        ),
      ),
    );
  }
}
