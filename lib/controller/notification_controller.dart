import 'package:get/get.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/core/services/services.dart';
import 'package:pckode/data/datasource/remote/orders/notification_data.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());

  MyServices myServices = Get.find();
  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData
        .getData(myServices.sharedPreferences.getString('id')!);
    print("================== Response Controller $response");
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

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
