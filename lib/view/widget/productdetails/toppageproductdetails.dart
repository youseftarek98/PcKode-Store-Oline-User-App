import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/productdetails_controller.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/linkapi.dart';

class TopPageProductDetails extends GetView<ProductDetailsControllerImp> {
  const TopPageProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: AppColor.secoundColor,
          ),
        ),
        Positioned(
          top: 50.0,
          right: Get.width / 9,
          left: Get.width / 9,
          child: Hero(
            tag: '${controller.itemsModel.itemsId}',
            child: CachedNetworkImage(
              imageUrl:
                  '${AppLink.imageItems}/${controller.itemsModel.itemsImage!}',
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
