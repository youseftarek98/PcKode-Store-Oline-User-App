import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pckode/controller/orders/archive_controller.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/data/model/ordersmodel.dart';
import 'package:pckode/view/widget/orders/dialograting.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;

  const CardOrdersListArchive({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '136 : #${listdata.ordersId}'.tr,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(Jiffy(listdata.ordersDatetime!, 'yyyy-MM-dd').fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColr,
                        fontWeight: FontWeight.bold))
              ],
            ),
            const Divider(),
            Text(
              '134 : ${controller.printOrdersType(listdata.ordersType!)}'.tr,
            ),
            Text(
              '135 : ${listdata.ordersPrice} \$'.tr,
            ),
            Text(
              '133 : ${listdata.ordersPricedelivery} \$'.tr,
            ),
            Text(
              '132 : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}'.tr,
            ),
            Text(
              '131 : ${controller.printOrdersStatus(listdata.ordersStatus!)}'.tr,
            ),
            const Divider(),
            Row(
              children: [
                Text(
                  '86 : ${listdata.ordersPrice} \$'.tr,
                  style: const TextStyle(
                      color: AppColor.primaryColr, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersdetails,
                        arguments: {"ordersmodel": listdata});
                  },
                  color: AppColor.thirdColor,
                  textColor: AppColor.secoundColor,
                  child:  Text('130'.tr),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (listdata.ordersRating == '0')
                  MaterialButton(
                    onPressed: () {
                      showDialogRating(context, listdata.ordersId!);
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secoundColor,
                    child:  Text('137'.tr),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
