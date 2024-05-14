import 'package:be_healthy/core/class/curd.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username, String passwordConfirm,String email,String password,String phone) async {
    var response = await crud.postData("http://192.168.1.4:3000/api/v1/auth/signup", {
      "name": username,
      "password": password,
      "passwordConfirm": passwordConfirm,
      "email": email,
      "phone": phone,
    });
    return response;
  }
}
