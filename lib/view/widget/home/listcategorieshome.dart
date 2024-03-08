import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/home_controller.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/functions/translatedatabase.dart';
import 'package:pckode/data/model/categorisemodel.dart';
import 'package:pckode/linkapi.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

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

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;

  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
               // color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 70,
            width: 120,
            child: Image.network(
              "${AppLink.imageCategories}/${categoriesModel.categoriesImage}" ,
               height: 100,
               width: 150,
               fit: BoxFit.fill,)
            // SvgPicture.network(
            //   "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
            //   color: AppColor.secoundColor,
            // ),
          ),
          Text(
            //categoriesModel.categoriesName
            '${translatedatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}',
            style: TextStyle(fontSize: 13, color: AppColor.black),
          ),
        ],
      ),
    );
  }
}
