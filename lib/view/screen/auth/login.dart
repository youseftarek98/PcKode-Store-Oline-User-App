import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/auth/login_controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/functions/alertexitapp.dart';
import 'package:pckode/core/functions/validinput.dart';
import 'package:pckode/view/widget/auth/custom_buttom_auth.dart';
import 'package:pckode/view/widget/auth/custom_text_body_auth.dart';
import 'package:pckode/view/widget/auth/custom_text_form_auth.dart';
import 'package:pckode/view/widget/auth/custom_text_titel_auth.dart';
import 'package:pckode/view/widget/auth/logo_auth.dart';
import 'package:pckode/view/widget/auth/text_signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgoundcolor,
          elevation: 0.0,
          title: Text(
            '15'.tr,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColor.grey,
                ),
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 30),
                        child: Form(
                          key: controller.formState,
                          child: ListView(
                            children: [
                              const LogoAuth(),
                              CustomTextTitelAuth(text: '10'.tr),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextBodyAuth(
                                text: '11'.tr,
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
                                valid: (val) {
                                  return validInput(val!, 5, 100, 'email');
                                },
                              ),
                              GetBuilder<LoginControllerImp>(
                                builder: (controller) => CustomTextFormAuth(
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
                              ),
                              InkWell(
                                onTap: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text(
                                  '14'.tr,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              CustomButtomAuth(
                                text: '15'.tr,
                                onPressed: () {
                                  controller.login();
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomTextSignUpOrSignIn(
                                text1: "16".tr,
                                text2: '17'.tr,
                                onTap: () {
                                  controller.goToSignUp();
                                },
                              )
                            ],
                          ),
                        ))))));
  }
}
