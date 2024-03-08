import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/core/services/services.dart';
import 'package:pckode/data/datasource/remote/cart_dara.dart';
import 'package:pckode/data/model/cartmodel.dart';
import 'package:pckode/data/model/couponmodel.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  int? discountcoupon = 0;
  String? couponname;

  String? couponid;

  CouponModel? couponModel;

  MyServices myServices = Get.find();

  List<CartModel> data = [];

  double priceorders = 0.0;

  int totalcountitems = 0;

  TextEditingController? controllercoupon;

  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString('id')!, itemsid);
    print(
        "================== Response Controller $response == add To Cart ====");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        Get.snackbar( '53'.tr,  '62'.tr  , duration:const Duration(seconds: 3) ,
        colorText: AppColor.white,
         backgroundColor: AppColor.primaryColr);
        //data.addAll(response["data"]) ;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageCheckout() {
    if (data.isEmpty) {
      return Get.snackbar( '43'.tr,  '111'.tr  , duration:const Duration(seconds: 3) ,
        colorText: AppColor.white,
         backgroundColor: AppColor.primaryColr);
    }
    Get.toNamed(AppRoute.checkOut, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceorders.toString(),
      "discountcoupon": discountcoupon.toString()
    });
  }

  getTotalPrice() {
    return (priceorders - priceorders * discountcoupon! / 100);
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString('id')!, itemsid);
    print(
        "================== Response Controller $response == Delete From Cart ====");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        Get.snackbar( '53'.tr,  '61'.tr  , duration:const Duration(seconds: 3) ,
        colorText: AppColor.white,
         backgroundColor: AppColor.primaryColr);
        //data.addAll(response["data"]) ;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllercoupon!.text);
    print(
        "================== Response Controller $response == Delete From Cart ====");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        Map<String, dynamic> datacoupon = response["data"];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount!);
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        // statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("43".tr, "112".tr);
      }
    }
    update();
  }

  resetVariableCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVariableCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString('id')!);
    print(
        "================== Response Controller $response == Delete From Cart ====");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        if (response["datacart"]["status"] == 'success') {
          List dataresponse = response["datacart"]["data"];
          Map dataresponsecountprice = response["countprice"];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = int.parse(dataresponsecountprice["totalecount"]);
          priceorders = double.parse(dataresponsecountprice["totalprice"]);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}
