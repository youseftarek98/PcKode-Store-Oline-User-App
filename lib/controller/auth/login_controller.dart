import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/core/services/services.dart';
import 'package:pckode/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class LoginController extends GetxController {
  login();

  goToSignUp();

  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;

  late TextEditingController password;

  bool isShowPassword = true;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      //print("================== Response Controller $response") ;
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          if (response['data']['users_approve'] == '1') {
            myServices.sharedPreferences
                .setString('id', response['data']['users_id']);
            String userid = myServices.sharedPreferences.getString('id')!;
            myServices.sharedPreferences
                .setString('username', response['data']['users_name']);
            myServices.sharedPreferences
                .setString('email', response['data']['users_email']);
            myServices.sharedPreferences
                .setString('phone', response['data']['users_phone']);
            myServices.sharedPreferences.setString('step', '2');
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");
            Get.offNamed(AppRoute.homePage);
          } else {
            Get.offNamed(AppRoute.verfiyCodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(title: '43'.tr, middleText: "44".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print('Not Valid');
    }
  }

  @override
  goToSignUp() {
    Get.offAllNamed(AppRoute.signUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print('============================================== youssef');
      print(value);
      print('============================================== youssef');
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
