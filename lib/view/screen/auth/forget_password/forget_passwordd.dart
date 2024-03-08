import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/view/widget/auth/custom_buttom_auth.dart';
import 'package:pckode/view/widget/auth/custom_text_body_auth.dart';
import 'package:pckode/view/widget/auth/custom_text_form_auth.dart';
import 'package:pckode/view/widget/auth/custom_text_titel_auth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgoundcolor,
        elevation: 0.0,
        title: Text(
          '14'.tr,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppColor.grey,
              ),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                  child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTextTitelAuth(text: '27'.tr),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextBodyAuth(
                            text: '29'.tr,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormAuth(
                            isNumber: false,
                            hinttext: '12'.tr,
                            iconData: Icons.email_outlined,
                            labeltext: '18'.tr,
                            mycontroller: controller.email,
                            valid: (val) {},
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          CustomButtomAuth(
                            text: '30'.tr,
                            onPressed: () {
                              controller.checkemail();
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
