import 'package:get/get.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/constant/routes.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/core/services/services.dart';
import 'package:pckode/data/datasource/remote/orders/pending_data.dart';
import 'package:pckode/data/model/ordersmodel.dart';

class OrdersPendingController extends GetxController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

goToPageTracking(OrdersModel ordersModel){
  Get.toNamed(AppRoute.orderstracking ,  arguments: {
                      "ordersmodel" : ordersModel
                     }) ;
}

  String printOrdersType(String val) {
    if (val == '0') {
      return "72".tr;
    } else {
      return "73".tr;
    }
  }

  String printPaymentMethod(String val) {
    if (val == '0') {
      return "74".tr;
    } else {
      return "75".tr;
    }
  }

  String printOrdersStatus(String val) {
    if (val == '0') {
      return "107".tr;
    } else if (val == '1') {
      return "108".tr;
    } else if (val == '2') {
      return "109".tr;
    } else if (val == '3') {
      return "110".tr;
    } else {
      return "64".tr;
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await ordersPendingData
        .getData(myServices.sharedPreferences.getString('id')!);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        List listdata = response["data"];

        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteOrder(String orderid) async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await ordersPendingData.deleteData(orderid);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        refreshOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
