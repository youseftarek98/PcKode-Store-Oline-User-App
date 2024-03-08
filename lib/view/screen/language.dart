import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/core/localization/change_local.dart';
import 'package:pckode/view/widget/language/custom_button_language.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '1'.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonLanguage(
              textButton: 'Ar',
              onPressed: () {
                controller.changeLanguage("ar");
                Get.toNamed(AppRoute.onboarding);
              },
            ),
            CustomButtonLanguage(
              textButton: 'En',
              onPressed: () {
                controller.changeLanguage("en");
                Get.toNamed(AppRoute.onboarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
