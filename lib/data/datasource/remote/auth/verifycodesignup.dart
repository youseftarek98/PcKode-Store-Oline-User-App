import 'package:pckode/core/class/crud.dart';
import 'package:pckode/linkapi.dart';

class VerifyCodeSignUpData {
  Crud crud;

  VerifyCodeSignUpData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.verifycodesignup, {
      "email": email,
      "verifycode": verifyCode,
    });
    return response.fold((l) => 1, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resend, {"email": email});
    return response.fold((l) => 1, (r) => r);
  }
}
