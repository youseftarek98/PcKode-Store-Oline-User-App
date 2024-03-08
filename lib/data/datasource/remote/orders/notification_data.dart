import 'package:pckode/core/class/crud.dart';
import 'package:pckode/linkapi.dart';

class NotificationData {
  Crud crud;

  NotificationData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.notification, {"id": id});
    return response.fold((l) => 1, (r) => r);
  }
}
