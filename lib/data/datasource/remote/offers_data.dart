import 'package:pckode/core/class/crud.dart';
import 'package:pckode/linkapi.dart';

class OffersData {
  Crud crud;

  OffersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.offers, {});
    return response.fold((l) => 1, (r) => r);
  }
}
