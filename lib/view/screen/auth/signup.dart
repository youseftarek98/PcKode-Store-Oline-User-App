import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/auth/signup_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/functions/alertexitapp.dart';
import 'package:pckode/core/functions/validinput.dart';
import 'package:pckode/view/widget/auth/custom_buttom_auth.dart';
import 'package:pckode/view/widget/auth/custom_text_body_auth.dart';
import 'package:pckode/view/widget/auth/custom_text_form_auth.dart';
import 'package:pckode/view/widget/auth/custom_text_titel_auth.dart';
import 'package:pckode/view/widget/auth/text_signup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgoundcolor,
        elevation: 0.0,
        title: Text(
          '17'.tr,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppColor.grey,
              ),
        ),
      ),
      body: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: WillPopScope(
                    onWillPop: alertExitApp,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 30),
                        child: Form(
                          key: controller.formState,
                          child: ListView(
                            children: [
                              CustomTextTitelAuth(text: '10'.tr),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextBodyAuth(
                                text: '24'.tr,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomTextFormAuth(
                                isNumber: false,
                                hinttext: '23'.tr,
                                iconData: Icons.person_outline,
                                labeltext: '20'.tr,
                                mycontroller: controller.username,
                                valid: (val) {
                                  return validInput(val!, 5, 100, 'username');
                                },
                              ),
                              CustomTextFormAuth(
                                isNumber: false,
                                hinttext: '12'.tr,
                                iconData: Icons.email_outlined,
                                labeltext: '18'.tr,
                                mycontroller: controller.email,
                                valid: (val) {
                                  return validInput(val!, 3, 40, 'email');
                                },
                              ),
                              CustomTextFormAuth(
                                isNumber: true,
                                hinttext: '22'.tr,
                                iconData: Icons.phone_android_outlined,
                                labeltext: '21'.tr,
                                mycontroller: controller.phone,
                                valid: (val) {
                                  return validInput(val!, 7, 11, 'phone');
                                },
                              ),
                              CustomTextFormAuth(
                                isNumber: false,
                                hinttext: '13'.tr,
                                iconData: Icons.lock_outline,
                                labeltext: '19'.tr,
                                mycontroller: controller.password,
                                obscureText: controller.isShowPassword,
                                onTapIcon: () {
                                  controller.showPassword();
                                },
                                valid: (val) {
                                  return validInput(val!, 3, 40, 'password');
                                },
                              ),
                              CustomButtomAuth(
                                text: '17'.tr,
                                onPressed: () {
                                  controller.signUp();
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomTextSignUpOrSignIn(
                                text1: "25".tr,
                                text2: '15'.tr,
                                onTap: () {
                                  controller.goToLogin();
                                },
                              )
                            ],
                          ),
                        ))),
              )),
    );
  }
}
