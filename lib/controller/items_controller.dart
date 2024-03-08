import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/controller/home_controller.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/core/services/services.dart';
import 'package:pckode/data/datasource/remote/items_data.dart';
import 'package:pckode/data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController {
  initialData();

  changeCat(int val, String catval);

  getItems(String categoryid);

  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  ItemsData testData = ItemsData(Get.find());

  List categories = [];

  int? selectedCat;

  String? catid;

  String deliverytime = '';

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    deliverytime = myServices.sharedPreferences.getString('deliverytime')!;
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await testData.getData(
        categoryid, myServices.sharedPreferences.getString('id')!);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        data.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}
