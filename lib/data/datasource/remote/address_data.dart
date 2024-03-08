import 'package:pckode/core/class/crud.dart';
import 'package:pckode/linkapi.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.addressview, {
      "usersid": usersid,
    });
    return response.fold((l) => 1, (r) => r);
  }

  addData(String usersid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => 1, (r) => r);
  }

  deleteData(String addressid) async {
    var response = await crud.postData(AppLink.addressDelete, {
      "addressid": addressid,
    });
    return response.fold((l) => 1, (r) => r);
  }
}
