import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/items_controller.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/functions/translatedatabase.dart';
import 'package:pckode/data/model/categorisemodel.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          separatorBuilder: (_, index) => const SizedBox(width: 10),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
            );
          }),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;

  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                    decoration: controller.selectedCat == i
                        ? const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 3, color: AppColor.primaryColr)))
                        : null,
                    child: Text(
                      '${translatedatabase(categoriesModel.categoriesNameAr, 
                      categoriesModel.categoriesName)}',
                      style: TextStyle(fontSize: 20, color: AppColor.grey2),
                    ),
                  )),
        ],
      ),
    );
  }
}
