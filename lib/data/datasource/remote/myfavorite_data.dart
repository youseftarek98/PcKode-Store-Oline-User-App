import 'package:pckode/core/class/crud.dart';
import 'package:pckode/linkapi.dart';

class MyFavoruteData {
  Crud crud;

  MyFavoruteData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.favoriteView, {'id': id});
    return response.fold((l) => 1, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.deletefromfavorite, {'id': id});
    return response.fold((l) => 1, (r) => r);
  }
}
