import 'package:be_healthy/controller/favourite_controller.dart';
import 'package:be_healthy/core/constant/color.dart';
import 'package:be_healthy/widget/offline_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteController controller = Get.put(FavouriteController());
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "MyFavorite".tr,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Obx(
        () => controller.connectivityService.isConnected
            ? const FavoriteItems()
            : const OfflineWidget(),
      ),
    );
  }
}

class FavoriteItems extends StatelessWidget {
  const FavoriteItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(
        builder: (controller) => ListView.builder(
              itemCount: controller.favouriteModel.data?.length ?? 0,
              itemBuilder: (context, index) => controller.isLoading
                  ? Lottie.asset("assets/lotties/loading.json",
                      width: 100, height: 100)
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Image.network(
                            "${controller.favouriteModel.data?[index].image}",
                            fit: BoxFit.cover,
                            // width: 300,
                          ),
                          Positioned(
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: InkWell(
                                onTap: () {
                                  controller.deleteFav(
                                      "${controller.favouriteModel.data?[index].sId}");
                                },
                                child: const FaIcon(
                                  FontAwesomeIcons.trashCan,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              width: MediaQuery.of(context).size.width * .956,
                              decoration: BoxDecoration(
                                  color: Colors.black38.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(1)),
                              child: Text(
                                "${controller.favouriteModel.data![index].name}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: (const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    // backgroundColor: Colors.black38
                                    color: Colors.white)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ));
  }
}
