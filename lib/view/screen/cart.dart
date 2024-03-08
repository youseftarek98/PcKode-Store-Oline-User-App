import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/cart_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/functions/translatedatabase.dart';
import 'package:pckode/view/widget/cart/custom_bottom_navigationbar_cart.dart';
import 'package:pckode/view/widget/cart/customitemscartlist.dart';
import 'package:pckode/view/widget/cart/topcardcart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '55'.tr,
          ),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavigationBarCart(
                  controllercoupon: controller.controllercoupon!,
                  onApplyCoupon: () {
                    controller.checkcoupon();
                  },
                  price: '${cartController.priceorders}',
                  discount: '${controller.discountcoupon}%',
                  totalprice: '${controller.getTotalPrice()}',
                  shipping: '10',
                )),
        body: GetBuilder<CartController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TopCardCart(
                      message:
                          'You Have ${cartController.totalcountitems} Items in Your List',
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                              cartController.data.length,
                              (index) => 
                              CustomItemsCartList(
                                    name:
                                        '${translatedatabase(cartController.data[index].itemsNameAr, cartController.data[index].itemsName)} ',
                                    price:
                                        '${cartController.data[index].itemsprice}\$',
                                    count:
                                        '${cartController.data[index].countitems}',
                                    imagename:
                                        '${cartController.data[index].itemsImage}',
                                    onAdd: () async {
                                      await cartController.add(
                                          cartController.data[index].itemsId!);
                                      cartController.refreshPage();
                                    },
                                    onRemove: () async {
                                      await cartController.delete(
                                          cartController.data[index].itemsId!);
                                      cartController.refreshPage();
                                    },
                                  )
                                  )
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
