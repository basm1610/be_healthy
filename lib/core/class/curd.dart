// import 'dart:convert';

// import 'package:be_healthy/core/class/status_request.dart';
// import 'package:http/http.dart' as http;

// class Crud {
//   Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
//     try {

//         var response = await http.post(Uri.parse(linkurl), body: data);
//         print(response.statusCode);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map responsebody = jsonDecode(response.body);
//           print(responsebody) ;
//           // return Right(responsebody);
//         }

//     } catch (_) {
//       // return const Left(StatusRequest.serverException);
//     }
//   }
// }

import 'dart:convert';


import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Crud {
  // Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
  //   try {
  //       var response = await http.post(Uri.parse(linkurl), body: data);
  //       print(response.statusCode);
  //       if (response.statusCode == 200 || response.statusCode == 201) {
  //         Map responsebody = jsonDecode(response.body);
  //         print(responsebody) ;
  //         return Right(responsebody);
  //       } else {
  //         return const Left(StatusRequest.serverFailure);
  //       }

  //   } catch (_) {
  //     return const Left(StatusRequest.serverException);
  //   }
  // }

  Future<Object?> postData(String linkurl, Map data) async {
    try {
      var response = await http.post(Uri.parse(linkurl), body: data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);
        return responsebody;
      } else {
        Get.defaultDialog(
            title: "Error", middleText: "please check your data..!");
      }
    } catch (_) {
      Get.defaultDialog(title: "Error" , middleText: "Server Exception") ;
    }
    return null ;
  }
}
