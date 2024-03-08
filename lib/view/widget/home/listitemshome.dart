import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/home_controller.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/functions/translatedatabase.dart';
import 'package:pckode/data/model/itemsmodel.dart';
import 'package:pckode/linkapi.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[index]));
          }),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;

  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.network(
              '${AppLink.imageItems}/${itemsModel.itemsImage}',
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColor.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            height: 120,
            width: 200,
          ),
          Positioned(
              left: 10,
              child: Text(
                '${translatedatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}',
                style: const TextStyle(
                    color: AppColor.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 17),
              ))
        ],
      ),
    );
  }
}
