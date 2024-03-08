import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/core/services/services.dart';
import 'package:pckode/data/datasource/remote/address_data.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  TextEditingController? name;

  TextEditingController? city;

  TextEditingController? street;

  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();

  String? lat;

  String? long;

  intialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print('$lat =============================');
    print('$long =============================');
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        myServices.sharedPreferences.getString('id')!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);
    print("================== Response Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        Get.offAllNamed(AppRoute.homePage);
        Get.snackbar('32'.tr, '101'.tr);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
