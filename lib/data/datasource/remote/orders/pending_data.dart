import 'package:pckode/core/class/crud.dart';
import 'package:pckode/linkapi.dart';

class OrdersPendingData {
  Crud crud;

  OrdersPendingData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.pendingorders, {"id": userid});
    return response.fold((l) => 1, (r) => r);
  }

  deleteData(String ordersid) async {
    var response = await crud.postData(AppLink.ordersdelete, {"id": ordersid});
    return response.fold((l) => 1, (r) => r);
  }
}
