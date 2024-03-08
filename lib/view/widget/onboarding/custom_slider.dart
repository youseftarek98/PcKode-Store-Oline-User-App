import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/onboarding_controller.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (_, i) => Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Image.asset(
                  onBoardingList[i].image!,
                  //width: 270,
                  height: Get.width / 2,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  onBoardingList[i].title!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: AppColor.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 2,
                        color: AppColor.grey1,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              ],
            ));
  }
}
