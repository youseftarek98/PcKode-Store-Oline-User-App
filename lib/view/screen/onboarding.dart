import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/onboarding_controller.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/view/widget/onboarding/custom_button.dart';
import 'package:pckode/view/widget/onboarding/custom_slider.dart';

import '../widget/onboarding/dot_controller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        backgroundColor: AppColor.backgoundcolor,
        body: SafeArea(
          child: Column(
            children: [
              const Expanded(flex: 4, child: CustomSliderOnBoarding()),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: const [
                      CustomDotControllerOnBoarding(),
                      Spacer(
                        flex: 2,
                      ),
                      CustomButtonOnBoarding(),
                    ],
                  ))
            ],
          ),
        ));
  }
}
