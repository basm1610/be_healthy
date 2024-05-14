 import 'package:get/get.dart';

validInput (String val ,int min ,int max ,String type){
  const String tMin = "can't be less than";
  const String tMax = "can't be greater than";

  if(val.isEmpty){
    return "can't be Empty";
  }
  if(type == "username"){
    if(!GetUtils.isUsername(val)){
      return "not valid username";
    }
  }
  if(type == "email"){
    if(!GetUtils.isEmail(val)){
      return "not valid email";
    }
  }
  if(type == "phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "not valid phone";
    }
  }
  if(val.length <min){
    return "$tMin$min";
  }
  if(val.length >max){
    return "$tMax$max";
  }


}