import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/productdetails_controller.dart';
import 'package:pckode/core/constant/color.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
            controller.subItems.length,
            (index) => Container(
                  width: 90,
                  height: 60,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.fourthColor),
                      color: controller.subItems[index]['active'] == '1'
                          ? AppColor.fourthColor
                          : AppColor.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    controller.subItems[index]['name'],
                    style: TextStyle(
                        color: controller.subItems[index]['active'] == '1'
                            ? AppColor.white
                            : AppColor.fourthColor,
                        fontWeight: FontWeight.bold),
                  ),
                ))
      ],
    );
  }
}
