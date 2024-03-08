import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/auth/verifycodesignup-controller.dart';
import 'package:pckode/core/class/handlingdataview.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/view/widget/auth/custom_text_body_auth.dart';
import 'package:pckode/view/widget/auth/custom_text_titel_auth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgoundcolor,
          elevation: 0.0,
          title: Text(
            '42'.tr,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColor.grey,
                ),
          ),
        ),
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                    child: ListView(
                      children: [
                         CustomTextTitelAuth(text: '93'.tr),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextBodyAuth(
                          text:
                              '91 ${controller.email}'.tr,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        OtpTextField(
                          fieldWidth: 50,
                          borderRadius: BorderRadius.circular(20),
                          numberOfFields: 5,
                          borderColor: Color(0xFF512DA8),
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controller.goToSuccessSignUp(verificationCode);
                          }, // end onSubmit
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            controller.reSend();
                          },
                          child:  Center(
                              child: Text(
                            '92'.tr,
                            style:const TextStyle(
                                color: AppColor.primaryColr, fontSize: 20),
                          )),
                        )
                      ],
                    )))));
  }
}
