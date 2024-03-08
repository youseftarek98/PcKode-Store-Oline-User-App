import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/homescreen_controller.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/view/widget/home/custombuttonappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primaryColr,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: const Icon(Icons.shopping_basket_outlined),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomButtonAppBarHome(),
              body: WillPopScope(
                  child: controller.listPage.elementAt(controller.currentpage),
                  onWillPop: () {
                    Get.defaultDialog(
                        title: '43'.tr,
                        titleStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColr),
                        middleText: '90'.tr,
                        onCancel: () {},
                        onConfirm: () {
                          exit(0);
                        },
                        cancelTextColor: AppColor.secoundColor,
                        confirmTextColor: AppColor.secoundColor,
                        buttonColor: AppColor.thirdColor);
                    return Future.value(false);
                  }),
            ));
  }
}
