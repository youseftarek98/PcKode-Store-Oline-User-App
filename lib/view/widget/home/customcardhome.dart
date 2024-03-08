import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/home_controller.dart';
import 'package:pckode/core/constant/color.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;

  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
              alignment: Alignment.center,
              height: 150,
              decoration: BoxDecoration(
                  color: AppColor.primaryColr,
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                title: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                subtitle: Text(
                  body,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
              )),
          // Positioned(
          //   top: -20,
          //   right: controller.lang == "en" ? -20 : null,
          //   left: controller.lang == "ar" ? -20 : null,
          //   child: Container(
          //     width: 160,
          //     height: 160,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(160),
          //         color: AppColor.secoundColor),
          //   ),
          // )
        ],
      ),
    );
  }
}
