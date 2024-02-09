import 'package:be_healthy/core/class/curd.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username, String password) async {
    var response = await crud.postData("https://localhost:3000/login", {
      "username": username,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
