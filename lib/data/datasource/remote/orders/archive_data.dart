import 'package:pckode/core/class/crud.dart';
import 'package:pckode/linkapi.dart';

class OrdersArchiveData {
  Crud crud;

  OrdersArchiveData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.ordersarchive, {"id": userid});
    return response.fold((l) => 1, (r) => r);
  }

  ratinggData(String ordersid, String comment, String rating) async {
    var response = await crud.postData(AppLink.rating, {
      "id": ordersid,
      "comment": comment,
      "rating": rating,
    });
    return response.fold((l) => 1, (r) => r);
  }
}
