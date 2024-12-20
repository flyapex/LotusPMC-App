import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:lotuspmc/controller/db_controller.dart';
import 'package:lotuspmc/model/auth_model.dart';

final dio = Dio();

var baseUrl = 'http://sahedstar.xyz/api';

var headers = {
  "content-type": 'application/json;charset=UTF-8',
  'charset': 'utf-8',
  'Connection': 'keep-alive',
  'Authorization': 'Bearer ${getx.Get.find<DBController>().getUserToken()!}',
};

class ApiServiceLogin {
  static Future<LoginResponseModel?> manualLoginApi(
    LoginModel data,
  ) async {
    try {
      print(data.toJson());
      final response = await dio.post(
        '$baseUrl/login',
        data: loginModelToJson(data),
      );
      print(response.data);
      if (response.statusCode == 200) {
        return loginResponseModelFromJson(jsonEncode(response.data));
      }
      return null;
    } catch (e) {
      print("Unexpected Error: $e");
      return null;
    }
  }

  static Future<LoginResponseModel?> manualRegisterApi(
    RegisterModel data,
  ) async {
    try {
      final response = await dio.post(
        '$baseUrl/register',
        data: registerModelToJson(data),
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('----------xxx-------------');

        return loginResponseModelFromJson(jsonEncode(response.data));
      } else {
        print('----------yyy-------------');
        return null;
      }
    } catch (e) {
      print('------------zzz-----------');

      print("Unexpected Error: $e");
      return null;
    }
  }
}
