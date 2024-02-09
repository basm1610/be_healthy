import 'dart:convert';

import 'package:http/http.dart' as http;

class Crud {
  Future postData(String linkurl, Map data) async {
    try {
     
        var response = await http.post(Uri.parse(linkurl), body: data);
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody) ;
          // return Right(responsebody);
        } 
      
    } catch (_) {
      // return const Left(StatusRequest.serverException);
    }
  }
}