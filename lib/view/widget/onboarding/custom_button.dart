import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/onboarding_controller.dart';
import 'package:pckode/core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: const EdgeInsets.only(bottom: 30),
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          textColor: Colors.white,
          onPressed: () {
            controller.next();
          },
          color: AppColor.primaryColr,
          child: Text('8'.tr),
        ));
  }
}
