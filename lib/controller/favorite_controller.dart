import 'package:get/get.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/constant/color.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/core/services/services.dart';
import 'package:pckode/data/datasource/remote/favorite_data.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};

  List data = [];

  FavoriteData favoriteData = FavoriteData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString('id')!, itemsid);
    print(
        "================== Response Controller $response == add Favorite ====");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        Get.snackbar( '53'.tr,  '54'.tr  , duration:const Duration(seconds: 3) ,
        colorText: AppColor.white,
         backgroundColor: AppColor.primaryColr);
        //data.addAll(response["data"]) ;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString('id')!, itemsid);
    print(
        "================== Response Controller $response == remove Favorite ====");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        Get.snackbar( '53'.tr, '52'.tr , duration: const Duration(seconds: 3) ,
        colorText: AppColor.white,
         backgroundColor: AppColor.primaryColr);
        // data.addAll(response["data"]) ;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
