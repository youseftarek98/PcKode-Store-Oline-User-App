import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/orders/archive_controller.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/constant/imageassets.dart';
import 'package:rating_dialog/rating_dialog.dart';

// show the dialog
void showDialogRating(BuildContext context, String ordersid) {
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
            initialRating: 1.0,
            // your app's name?
            title:  Text(
              '99'.tr,
              textAlign: TextAlign.center,
              style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // encourage your user to leave a high rating?
            message:  Text(
              '100'.tr,
              textAlign: TextAlign.center,
              style:const TextStyle(fontSize: 15),
            ),
            // your app's logo?
            image: Image.asset(
              AppImageAssets.logo,
              height: 200,
              width: 200,
            ),
            submitButtonText: '39'.tr,
            submitButtonTextStyle: const TextStyle(
                color: AppColor.primaryColr, fontWeight: FontWeight.bold),
            commentHint: '127'.tr,
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              OrdersArchiveController controller = Get.find();
              controller.submitRating(
                  ordersid, response.rating, response.comment);
            },
          ));
}
