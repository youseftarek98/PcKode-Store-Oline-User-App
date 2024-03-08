
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/checkout_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/constant/imageassets.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/view/widget/checkout/carddeliverytype.dart';
import 'package:pckode/view/widget/checkout/cardpymentmethod.dart';
import 'package:pckode/view/widget/checkout/cardshippingaddress.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title:  Text('76'.tr),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
            color: AppColor.secoundColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child:  Text(
              "76".tr,
              style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
      ),
      body: GetBuilder<CheckoutController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                   Text(
                      "77".tr,
                      style:const TextStyle(
                          color: AppColor.secoundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("0");
                        },
                        child: CardPymentMethodCheckout(
                            title: '74'.tr,
                            isActive: controller.paymentMethod == '0'
                                ? true
                                : false)),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("1");
                        },
                        child: CardPymentMethodCheckout(
                            title: '75'.tr,
                            isActive: controller.paymentMethod == '1'
                                ? true
                                : false)),
                    const SizedBox(
                      height: 20,
                    ),
                     Text(
                      "78".tr,
                      style:const TextStyle(
                          color: AppColor.secoundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.chooseDeliveryType('0');
                          },
                          child: CardDeliveryTypeCheckout(
                              imagename: AppImageAssets.deliveryImage,
                              title: '72'.tr,
                              active: controller.deliveryType == '0'
                                  ? true
                                  : false),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            controller.chooseDeliveryType('1');
                          },
                          child: CardDeliveryTypeCheckout(
                              imagename: AppImageAssets.drivethru,
                              title: '73'.tr,
                              active: controller.deliveryType == '1'
                                  ? true
                                  : false),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (controller.deliveryType == '0')
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         if (controller.dataaddress.isNotEmpty)
                             Text(
                              "80".tr,
                              style: const TextStyle(
                                  color: AppColor.secoundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),

                          if (controller.dataaddress.isEmpty)
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoute.addressadd);
                              },
                              child: Container(
                                child:  Center(
                                  child: Text(
                                    '79'.tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppColor.primaryColr,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),

                          
                         

                          const SizedBox(
                            height: 20,
                          ),
                          ...List.generate(
                            controller.dataaddress.length,
                            (index) => InkWell(
                              onTap: () {
                                controller.chooseShippingAddress(
                                    controller.dataaddress[index].addressId!);
                              },
                              child: CardShippingAddressCheckout(
                                  title:
                                      "${controller.dataaddress[index].addressName} ",
                                  body:
                                      "${controller.dataaddress[index].addressCity} - ${controller.dataaddress[index].addressStreet} ",
                                  isActive: controller.addressid ==
                                          controller
                                              .dataaddress[index].addressId
                                      ? true
                                      : false),
                            ),
                          )

                          // const CardShippingAddressCheckout(title: "Company ", body: "Company ksh njhbuh jhuhi jiu", isActive: false) ,
                        ],
                      )
                  ],
                ),
              ))),
    );
  }
}
