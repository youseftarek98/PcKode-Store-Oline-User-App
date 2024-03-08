// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pckode/core/class/status_request.dart';
// import 'package:pckode/core/constant/routes.dart';
// import 'package:pckode/core/functions/handlinfdatacontroller.dart';
// import 'package:pckode/core/services/services.dart';
// import 'package:pckode/data/datasource/remote/address_data.dart';
// import 'package:pckode/data/datasource/remote/checkout_data.dart';
// import 'package:pckode/data/model/addressmodel.dart';

// class CheckoutController extends GetxController {
//   AddressData addressData = Get.put(AddressData(Get.find()));

//   CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

//   StatusRequest statusRequest = StatusRequest.none;

//   MyServices myServices = Get.find();
//   List<AddressModel> dataaddress = [];

// String? paymentMethod;
//  String? deliveryType;
//  String? addressid ;


//   choosePaymentMethod(String val) {
//     paymentMethod = val;
//     update();
//   }

//   chooseDeliveryType(String val) {
//     deliveryType = val;
//     update();
//   }

//   chooseShippingAddress(String val) {
//     addressid = val;
//     update();
//   }


// getShippingAddress()async{
//       statusRequest = StatusRequest.loading ;
//     var response = await addressData.getData(myServices.sharedPreferences.getString('id')!);
//    // print("================== Response Controller $response llll") ;
//     statusRequest = handlingData(response) ;

//     if(StatusRequest.success== statusRequest){
//        if(response["status"] == 'success'){
//         List listdata = response['data'] ;
//         dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e))) ;
//        }else{
//        // statusRequest = StatusRequest.failure ;
//         // Container(
//         //   child: Center(
//         //     child: Text('Please Add A New Address'),
//         //   ),
//         // ) ;
//         print("================== Response Controller $response 222") ;
//        }
//     }
//     update() ;
// }

//   @override
//   void onInit() {
//     getShippingAddress() ;
//     super.onInit();
//   }
// }







import 'package:get/get.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/core/services/services.dart';
import 'package:pckode/data/datasource/remote/address_data.dart';
import 'package:pckode/data/datasource/remote/checkout_data.dart';
import 'package:pckode/data/model/addressmodel.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));

  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();
  List<AddressModel> dataaddress = [];

  String? paymentMethod;

  String? deliveryType;

  String addressid = '0';
  //String? addressId ;
  late String couponid;

  late String coupondiscount;

  late String priceorders;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString('id')!);
    print("================== Response Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      addressid = dataaddress[0].addressId.toString();
      } else {
        
        statusRequest = StatusRequest.success;
      }
      
    }
    update();
  }




  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar('113'.tr, '115'.tr);
    }
    if (deliveryType == null) {
      return Get.snackbar('113'.tr, '116'.tr);
    }
     if (dataaddress.isEmpty)
       {
        return Get.snackbar('113'.tr, '117');
        }

    statusRequest = StatusRequest.loading;
    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString('id')!,
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders,
      "couponid": couponid,
      "discountcoupon": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString()
    };

    var response = await checkoutData.checkout(data);
    print("================== Response Controller $response hhhhhhhhhhhhhhhhhhh");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        Get.offAllNamed(AppRoute.homePage);
        Get.snackbar('32'.tr, '114'.tr);
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar('113'.tr, '105'.tr);
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();

    getShippingAddress();
    super.onInit();
  }
}
