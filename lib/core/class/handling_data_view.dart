
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ?   Center(child: Lottie.asset(AppImageAsset.loading , width: 250 , height: 250))
        : statusRequest == StatusRequest.offlineFailure
        ? Center(child: Lottie.asset(AppImageAsset.offline , width: 250 , height: 250))
        : statusRequest == StatusRequest.serverFailure
        ?Center(child: Lottie.asset(AppImageAsset.server , width: 250 , height: 250))
        : statusRequest == StatusRequest.failure
        ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImageAsset.noData , width: 250 , height: 250 , repeat: true  ),
            Center(child: Text("No Product For You",style: TextStyle(color: AppColor.primaryColor.withAlpha(150),fontSize: 25,fontWeight: FontWeight.bold),))
          ],
        )
        : widget;
  }
}
class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ?   Center(child: Lottie.asset(AppImageAsset.loading , width: 250 , height: 250))
        : statusRequest == StatusRequest.offlineFailure
        ? Center(child: Lottie.asset(AppImageAsset.offline , width: 250 , height: 250))
        : statusRequest == StatusRequest.serverFailure
        ?Center(child: Lottie.asset(AppImageAsset.server , width: 250 , height: 250))
        : widget;
  }
}