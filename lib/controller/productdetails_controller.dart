import 'package:get/get.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/core/services/services.dart';
import 'package:pckode/data/datasource/remote/cart_dara.dart';
import 'package:pckode/data/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {


  late StatusRequest statusRequest;

  late ItemsModel itemsModel;

  CartData cartData = CartData(Get.find());

  MyServices myServices = Get.find();

  int countitems = 0;

  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  addItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString('id')!, itemsid);
    print(
        "================== Response Controller $response == add To Cart ====");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        Get.snackbar(
           '53'.tr , '62'.tr , duration:const Duration(seconds: 4) ,
        colorText: AppColor.white,
         backgroundColor: AppColor.primaryColr);
        //data.addAll(response["data"]) ;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString('id')!, itemsid);
    print(
        "================== Response Controller $response == Delete From Cart ====");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        Get.snackbar(
             '53'.tr, '61'.tr , duration: const Duration(seconds: 4) ,
        colorText: AppColor.white,
         backgroundColor: AppColor.primaryColr);
        //data.addAll(response["data"]) ;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;

    var response = await cartData.getCountCarts(
        myServices.sharedPreferences.getString('id')!, itemsid);
    print(
        "================== Response Controller $response == Delete From Cart ====");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        int countItems = 0;
        countItems = int.parse(response["data"]);
        print("===================================");
        print("$countItems ----------------------");
        return countItems;
        //data.addAll(response["data"]) ;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  List subItems = [
    {"name": 'red', "id": 1, "active": '0'},
    {"name": 'yallow', "id": 2, "active": '0'},
    {"name": 'black', "id": 3, "active": '1'},
  ];

  add() {
    addItems(itemsModel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      deleteItems(itemsModel.itemsId!);
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
