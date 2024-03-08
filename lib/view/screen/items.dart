import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/favorite_controller.dart';
import 'package:pckode/controller/items_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/data/model/itemsmodel.dart';
import 'package:pckode/view/screen/home.dart';
import 'package:pckode/view/widget/customappbar.dart';
import 'package:pckode/view/widget/items/customlistitems.dart';
import 'package:pckode/view/widget/items/listcategoriesitems.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                CustomAppBar(
                  mycontroller: controller.search!,
                  titleAppBar: '45'.tr,
                  onPressedIconFavorite: () {
                    Get.toNamed(AppRoute.myfavorite);
                  },
                  onPressedSearch: () {
                    controller.onSearchItems();
                  },
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                ),
                const SizedBox(height: 20),
                const ListCategoriesItems(),
                GetBuilder<ItemsControllerImp>(
                  builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: !controller.isSearch
                          ? GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.7),
                              itemBuilder: (_, index) {
                                controllerFav.isFavorite[controller.data[index]
                                        ['items_id']] =
                                    controller.data[index]['favorite'];
                                return CustomListItems(
                                    itemsModel: ItemsModel.fromJson(
                                        controller.data[index]));
                              })
                          : ListItemsSearch(
                              listDatamodel: controller.listData)),
                )
              ],
            )));
  }
}
