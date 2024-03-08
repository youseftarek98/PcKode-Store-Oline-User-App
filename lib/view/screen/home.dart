import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/home_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/core/functions/translatedatabase.dart';
import 'package:pckode/data/model/itemsmodel.dart';
import 'package:pckode/linkapi.dart';
import 'package:pckode/view/widget/customappbar.dart';
import 'package:pckode/view/widget/home/customcardhome.dart';
import 'package:pckode/view/widget/home/customtitlehome.dart';
import 'package:pckode/view/widget/home/listcategorieshome.dart';
import 'package:pckode/view/widget/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // if(controller.settingsdata.isNotEmpty)
                            CustomCardHome(
                                title: translatedatabase(
                                    controller.titleHomeCardAr,
                                    controller.titleHomeCard),
                                body: translatedatabase(
                                    controller.bodyHomeCardAr,
                                    controller.bodyHomeCard)),
                            CustomTitleHome(title: '49'.tr),
                            const ListCategoriesHome(),
                            CustomTitleHome(title: '70'.tr),
                            const ListItemsHome(),
                          ],
                        )
                      : ListItemsSearch(listDatamodel: controller.listData))
            ],
          )),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listDatamodel;

  const ListItemsSearch({super.key, required this.listDatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listDatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listDatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                              imageUrl:
                                  "${AppLink.imageItems}/${listDatamodel[index].itemsImage}")),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text(translatedatabase(
                                listDatamodel[index].itemsNameAr!,
                                listDatamodel[index].itemsName!)),
                            subtitle: Text(translatedatabase(
                                listDatamodel[index].categoriesNameAr!,
                                listDatamodel[index].categoriesName!)),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
