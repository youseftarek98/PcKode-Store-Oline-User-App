import 'package:get/get.dart';
import 'package:pckode/data/datasource/remote/address_data.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/core/services/services.dart';
import 'package:pckode/data/model/addressmodel.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();
  List<AddressModel> data = [];

  late StatusRequest statusRequest;

  deleteAddress(String addressid) {
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString('id')!);
    print("================== Response Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        List listdata = response["data"];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
