import 'package:pckode/core/class/crud.dart';
import 'package:pckode/linkapi.dart';

class CheckoutData {
  Crud crud;

  CheckoutData(this.crud);

  checkout(Map data) async {
    var response = await crud.postData(AppLink.checkout, data);
    return response.fold((l) => 1, (r) => r);
  }
}
