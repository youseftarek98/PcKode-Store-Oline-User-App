import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: '53'.tr,
      middleText: '90'.tr,
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text('39'.tr)),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('40'.tr)),
      ]);
  return Future.value(true);
}
