import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pckode/controller/orders/details_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/functions/translatedatabase.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title:  Text('85'.tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget:  Container(
                  child:  ListView(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Table(
                              children: [
                                 TableRow(children: [
                                   Center(
                                      child: Text(
                                    '88'.tr,
                                    style: const TextStyle(
                                        color: AppColor.primaryColr,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  Center(
                                      child: Text('89'.tr,
                                          style:const TextStyle(
                                              color: AppColor.primaryColr,
                                              fontWeight: FontWeight.bold))),
                                  Center(
                                      child: Text('87'.tr,
                                          style: const TextStyle(
                                              color: AppColor.primaryColr,
                                              fontWeight: FontWeight.bold))),
                                ]),
                                ...List.generate(
                                    controller.data.length,
                                    (index) => TableRow(children: [
                                          Center(
                                              child: Text(
                                                  '${translatedatabase(controller.data[index].itemsNameAr, controller.data[index].itemsName)}')),
                                          Center(
                                              child: Text(
                                                  '${controller.data[index].countitems}')),
                                          Center(
                                              child: Text(
                                                  '${controller.data[index].itemsPrice}')),
                                        ]))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                  "86 : ${controller.ordersModel!.ordersTotalprice}\$".tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: AppColor.primaryColr,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                      ),
                    ),
                    if (controller.ordersModel!.ordersType == '0')
                      Card(
                        child: Container(
                          child: ListTile(
                            title:  Text('80'.tr,
                                style:const TextStyle(
                                    color: AppColor.primaryColr,
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text(
                                '${controller.ordersModel!.addressCity} - ${controller.ordersModel!.addressStreet}'),
                          ),
                        ),
                      ),
                    if (controller.ordersModel!.ordersType == '0')
                      Card(
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: GoogleMap(
                            mapType: MapType.normal,
                            markers: controller.markers.toSet(),
                            initialCameraPosition: controller.cameraPosition!,
                            onMapCreated: (GoogleMapController controllermap) {
                              controller.completercontroller!
                                  .complete(controllermap);
                            },
                          ),
                        ),
                      )
                  ],
                ),
                )))),
      ),
    );
  }
}
