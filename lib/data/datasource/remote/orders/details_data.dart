import 'package:pckode/core/class/crud.dart';
import 'package:pckode/linkapi.dart';

class OrdersDetailsData {
  Crud crud;

  OrdersDetailsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.ordersdetails, {"id": id});
    return response.fold((l) => 1, (r) => r);
  }
}
