import 'package:pckode/core/class/crud.dart';
import 'package:pckode/linkapi.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addCart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartadd, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => 1, (r) => r);
  }

  deleteCart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartdelete, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => 1, (r) => r);
  }

  getCountCarts(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.cartgetcountitems, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => 1, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartview, {"usersid": usersid});
    return response.fold((l) => 1, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response =
        await crud.postData(AppLink.checkcoupon, {"couponname": couponname});
    return response.fold((l) => 1, (r) => r);
  }
}
