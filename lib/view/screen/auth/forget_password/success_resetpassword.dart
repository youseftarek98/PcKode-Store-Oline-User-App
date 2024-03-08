import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/auth/successresetpassword_controller.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/view/widget/auth/custom_buttom_auth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgoundcolor,
        elevation: 0.0,
        title: Text(
          '32'.tr,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppColor.grey,
              ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const  Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColr,
            ),
            Text(
              '37'.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 30),
            ),
            Text('36'.tr),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtomAuth(
                text: '31'.tr,
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
