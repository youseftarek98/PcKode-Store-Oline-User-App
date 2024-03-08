import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/orders/archive_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/view/widget/orders/orderslistcardarchive.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersArchiveController cartController = Get.put(OrdersArchiveController());
    return Scaffold(
      appBar: AppBar(
        title:  Text('64'.tr),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersArchiveController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => CardOrdersListArchive(
                          listdata: controller.data[index],
                        )))),
      ),
    );
  }
}
