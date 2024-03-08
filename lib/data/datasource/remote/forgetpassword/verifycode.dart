import 'package:pckode/core/class/crud.dart';
import 'package:pckode/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;

  VerifyCodeForgetPasswordData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifycodeforgetpassword, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => 1, (r) => r);
  }
}
