import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/core/services/services.dart';
import 'package:pckode/data/datasource/remote/home_data.dart';
import 'package:pckode/data/model/itemsmodel.dart';

abstract class HomeController extends SearchMixController {
  initialData();

  getdata();

  goToItems(List categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  HomeData homeData = HomeData(Get.find());

  List categories = [];

  List items = [];

  List settingsdata = [];

  MyServices myServices = Get.find();

  String? username;

  String? id;

  String? lang;

  String titleHomeCard = '';
  String bodyHomeCard = '';
  String titleHomeCardAr = '';
  String bodyHomeCardAr = '';
  String deliveryTime = '';

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        categories.addAll(response["categories"]["data"]);
        items.addAll(response["items"]["data"]);
        settingsdata.addAll(response["settings"]["data"]);

        titleHomeCard = settingsdata[0]['settings_titlehome'];
        bodyHomeCard = settingsdata[0]['settings_bodyhome'];
        titleHomeCardAr = settingsdata[0]['settings_titlehome_ar'];
        bodyHomeCardAr = settingsdata[0]['settings_bodyhome_ar'];
        deliveryTime = settingsdata[0]['settings_deliverytime'];

        myServices.sharedPreferences.setString('deliverytime', deliveryTime);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    FirebaseMessaging.instance.subscribeToTopic("users");
    initialData();
    getdata();
    super.onInit();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}

class SearchMixController extends GetxController {
  bool isSearch = false;

  TextEditingController? search;

  late StatusRequest statusRequest;

  HomeData homeData = HomeData(Get.find());

  List<ItemsModel> listData = [];

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        listData.clear();
        List responsedata = response["data"];
        listData.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
