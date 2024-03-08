import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/myfavorite_controller.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/functions/translatedatabase.dart';
import 'package:pckode/data/model/myfavorite.dart';
import 'package:pckode/linkapi.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoruteModel itemsModel;

  const CustomListFavoriteItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: '${itemsModel.itemsId}',
                child: CachedNetworkImage(
                  imageUrl: '${AppLink.imageItems}/${itemsModel.itemsImage}',
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  translatedatabase(
                      itemsModel.itemsNameAr!, itemsModel.itemsName!),
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Rating 3.5', textAlign: TextAlign.center),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 22,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  size: 15,
                                ))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${itemsModel.itemsPrice} \$',
                      style: const TextStyle(
                          color: AppColor.primaryColr,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'sans')),
                  IconButton(
                      onPressed: () {
                        controller.deleteFromFavorite(itemsModel.favoriteId!);
                      },
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        color: AppColor.primaryColr,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
