import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/cart_controller.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/view/widget/cart/buttomcart.dart';
import 'package:pckode/view/widget/cart/custombuttoncoupon.dart';

class BottomNavigationBarCart extends GetView<CartController> {
  final String price;

  final String discount;

  final String totalprice;

  final String shipping;

  final TextEditingController controllercoupon;

  final void Function()? onApplyCoupon;

  const BottomNavigationBarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalprice,
      required this.controllercoupon,
      this.onApplyCoupon,
      required this.shipping});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
              builder: (controller) => controller.couponname == null
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: controllercoupon,
                                decoration:  InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 7.7, horizontal: 10),
                                    hintText: "94".tr,
                                    border: const OutlineInputBorder()),
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              flex: 1,
                              child: CustomButtonCoupon(
                                textButton: '33'.tr,
                                onPressed: onApplyCoupon,
                              ))
                        ],
                      ),
                    )
                  : Container(
                      child: Text(
                        "94 :  ${controller.couponname}".tr,
                        style: const TextStyle(
                            color: AppColor.primaryColr,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColr, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child:  Text(
                          '87'.tr,
                          style: const TextStyle(fontSize: 16),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('$price \$',
                            style: const TextStyle(fontSize: 16))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child:  Text(
                          '95'.tr,
                          style: const TextStyle(fontSize: 16),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('$discount ',
                            style: const TextStyle(fontSize: 16))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child:  Text(
                          '96'.tr,
                          style:const TextStyle(fontSize: 16),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('$shipping ',
                            style: const TextStyle(fontSize: 16))),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child:  Text(
                          '86'.tr,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColr),
                        )),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('$totalprice \$',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColr))),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButtonCart(
            textButton: '97'.tr,
            onPressed: () {
              controller.goToPageCheckout();
            },
          )
        ],
      ),
    );
  }
}
