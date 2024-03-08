import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  signUp();

  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController username;

  late TextEditingController email;

  late TextEditingController phone;

  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());

  List data = [];

  bool isShowPassword = true;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  signUp() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
          username.text, password.text, email.text, phone.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          //  data.addAll(response["data"]) ;
          Get.offNamed(AppRoute.verfiyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: '43'.tr,
              middleText: "102".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print('Not Valid');
    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
