import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/myfavorite_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/view/widget/customappbar.dart';
import 'package:pckode/view/widget/myfavorite/customlistfavorite.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      appBar: AppBar(
        title:  Text('138'.tr),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyFavoriteController>(
            builder: (controller) => ListView(
              children: [
                //  CustomAppBar(
                //           titleAppBar: '45'.tr,
                //           onPressedSearch: () {} ,
                //           onPressedIconFavorite: (){
                //             Get.toNamed(AppRoute.myfavorite) ;
                //           },
                //           ),
                const SizedBox(
                  height: 20,
                ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (_, index) {
                          return CustomListFavoriteItems(
                              itemsModel: controller.data[index]);
                        }))
              ],
            ),
          )),
    );
  }
}

//// part 9
