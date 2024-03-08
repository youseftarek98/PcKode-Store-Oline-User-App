import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/favorite_controller.dart';
import 'package:pckode/controller/offers_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/view/screen/home.dart';
import 'package:pckode/view/widget/customappbar.dart';
import 'package:pckode/view/widget/offers/customitemsoffers.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GetBuilder<OffersController>(
        builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  const SizedBox(
                    height: 20,
                  ),
                  !controller.isSearch
                      ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.data.length,
                              itemBuilder: (_, index) => CustomItemsOffers(
                                  itemsModel: controller.data[index])))
                      : ListItemsSearch(listDatamodel: controller.listData)
                ],
              ),
            ));
  }
}
