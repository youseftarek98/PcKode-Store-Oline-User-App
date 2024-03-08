import 'package:pckode/core/class/crud.dart';
import 'package:pckode/linkapi.dart';

class ResetPasswordData {
  Crud crud;

  ResetPasswordData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.resetPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => 1, (r) => r);
  }
}
