import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/favorite_controller.dart';
import 'package:pckode/controller/items_controller.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/constant/imageassets.dart';
import 'package:pckode/core/functions/translatedatabase.dart';
import 'package:pckode/data/model/itemsmodel.dart';
import 'package:pckode/linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: '${itemsModel.itemsId}',
                    child: CachedNetworkImage(
                      imageUrl:
                          '${AppLink.imageItems}/${itemsModel.itemsImage}',
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      translatedatabase(
                          itemsModel.itemsNameAr!, itemsModel.itemsName!),
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Icon(Icons.timer_sharp, color: AppColor.grey)),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${controller.deliverytime} 98'.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontFamily: "sans"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${itemsModel.itemspricediscount} \$',
                          style: const TextStyle(
                              color: AppColor.primaryColr,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'sans')),
                      GetBuilder<FavoriteController>(
                          builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[itemsModel.itemsId] ==
                                    '1') {
                                  controller.setFavorite(
                                      itemsModel.itemsId, '0');
                                  controller
                                      .removeFavorite(itemsModel.itemsId!);
                                } else {
                                  controller.setFavorite(
                                      itemsModel.itemsId, '1');
                                  controller.addFavorite(itemsModel.itemsId!);
                                }
                              },
                              icon: Icon(
                                controller.isFavorite[itemsModel.itemsId] == '1'
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.primaryColr,
                              )))
                    ],
                  )
                ],
              ),
            ),
            if (itemsModel.itemsDiscount != "0")
              Positioned(
                  top: 2,
                  left: 2,
                  child: Image.asset(
                    AppImageAssets.saleOne,
                    width: 40,
                  ))
          ],
        ),
      ),
    );
  }
}
