import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/home_controller.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/data/datasource/remote/offers_data.dart';
import 'package:pckode/data/model/itemsmodel.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    print("================== Response Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        List listdata2 = response["data"];
        data.addAll(listdata2.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
