import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/productdetails_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/core/functions/translatedatabase.dart';
import 'package:pckode/view/widget/productdetails/priceandcount.dart';
import 'package:pckode/view/widget/productdetails/toppageproductdetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 40,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.secoundColor,
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          child: Text(
            '51'.tr,
            style: const TextStyle(
                color: AppColor.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  const TopPageProductDetails(),
                  const SizedBox(
                    height: 150,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${translatedatabase(controller.itemsModel.itemsNameAr , controller.itemsModel.itemsName)}',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppColor.fourthColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        PriceAndCountItems(
                            onAdd: () {
                              controller.add();
                            },
                            onRemove: () {
                              controller.remove();
                            },
                            price:
                                '${controller.itemsModel.itemspricediscount}',
                            count: '${controller.countitems}'),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            '${translatedatabase(controller.itemsModel.itemsDescAr ,controller.itemsModel.itemsDesc)}',
                            style: Theme.of(context).textTheme.bodyLarge ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
