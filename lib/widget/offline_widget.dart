import 'package:be_healthy/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppImageAsset.offline,
            ),
            Text(
              "Please check your internet connection.",
              style: TextStyle(
                  color: Colors.grey.withOpacity(.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            )
          ],
        ),
      );
  }
}
