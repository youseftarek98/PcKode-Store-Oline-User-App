import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/forgetpassword/resetpassword_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/functions/validinput.dart';
import 'package:pckode/view/widget/auth/custom_buttom_auth.dart';
import 'package:pckode/view/widget/auth/custom_text_body_auth.dart';
import 'package:pckode/view/widget/auth/custom_text_form_auth.dart';
import 'package:pckode/view/widget/auth/custom_text_titel_auth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgoundcolor,
        elevation: 0.0,
        title: Text(
          '41'.tr,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppColor.grey,
              ),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                  child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTextTitelAuth(text: '35'.tr),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextBodyAuth(
                            text: '34'.tr,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormAuth(
                            isNumber: false,
                            hinttext: '13'.tr,
                            iconData: Icons.lock_outline,
                            labeltext: '19'.tr,
                            mycontroller: controller.password,
                            valid: (val) {
                              return validInput(val!, 3, 40, 'password');
                            },
                          ),
                          CustomTextFormAuth(
                            isNumber: false,
                            hinttext: "Re" + " " + "13".tr,
                            iconData: Icons.lock_outline,
                            labeltext: '19'.tr,
                            mycontroller: controller.rePassword,
                            valid: (val) {
                              return validInput(val!, 3, 40, 'password');
                            },
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          CustomButtomAuth(
                            text: '33'.tr,
                            onPressed: () {
                              controller.goToSuccessResetPassword();
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ))))),
    );
  }
}
