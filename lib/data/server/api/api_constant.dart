import 'package:abu_sahiy/data/storage/auth/auth_holder.dart';
import 'package:get/get.dart';

class ApiConst{
  static const CONNECTION_TIME = 20000;
  static const SEND_TIME_OUT = 20000;
  static const String Base_URl = "https://api.yougo.uz";

  static  Map<String,String> HEADERS = {
    'Content-type' : 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Get.find<AuthHolder>().authToken}',
  };

  static Map<String, String> QUERY = {
    "page" : "0",
    "size" : "50",
  };

  static const String LOGIN = "/api/v1/auth/profile/login";


}