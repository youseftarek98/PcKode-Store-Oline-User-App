import 'package:get/get.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/core/services/services.dart';
import 'package:pckode/data/datasource/remote/myfavorite_data.dart';
import 'package:pckode/data/model/myfavorite.dart';

class MyFavoriteController extends GetxController {
  List<MyFavoruteModel> data = [];

  MyFavoruteData myFavoriteData = MyFavoruteData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await myFavoriteData
        .getData(myServices.sharedPreferences.getString('id')!);
    print(
        "================== Response Controller $response == Get Data Favorite ====");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoruteModel.fromJson(e)));

        print('data');
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(String favoriteid) {
    //data.clear() ;
    //  statusRequest = StatusRequest.loading ;
    var response = myFavoriteData.deleteData(favoriteid);
    data.removeWhere((element) => element.favoriteId == favoriteid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
