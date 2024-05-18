import 'package:be_healthy/core/class/curd.dart';
import 'package:be_healthy/core/constant/link_api.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String password ,String email ) async {
    var response = await crud.postData(AppLink.linkLogin, {
      "email" : email  ,
      "password" : password ,
    });
    return response.fold((l) => l, (r) => r);
  }
}