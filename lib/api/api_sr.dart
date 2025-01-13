import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:lotuspmc/model/common.dart';
import 'package:lotuspmc/model/sr/sr_open.dart';
import 'package:lotuspmc/model/sr/sr_send.dart';

import 'common.dart';

final dio = Dio();

var baseUrl = 'http://sahedstar.xyz/api/sr';

class ApiServiceSR {
  static Future<ResponseModel?> srSendApi(
    ServiceRequestSendModel data,
  ) async {
    try {
      print('Service Request Data: ${data.toJson()}');
      final response = await dio.post(
        '$baseUrl/sr/submit',
        data: serviceRequestSendModelToJson(data),
        options: Options(headers: headers),
      );
      print(response);
      print(response.data);
      if (response.statusCode == 200) {
        return responseModelFromJson(jsonEncode(response.data));
      }
      return null;
    } catch (e) {
      print("Unexpected Error: $e");
      return null;
    }
  }

  static Future<SrReciveModel?> srOpenApi() async {
    try {
      final response = await dio.get(
        '$baseUrl/open/$userID',
        options: Options(headers: headers),
      );
      print(response.data);
      if (response.statusCode == 200) {
        return srReciveModelFromJson(jsonEncode(response.data));
      }
      return null;
    } catch (e) {
      print("Unexpected Error: $e");
      return null;
    }
  }

  static Future<SrReciveModel?> srCompletedApi() async {
    try {
      final response = await dio.get(
        '$baseUrl/completed/$userID',
        options: Options(headers: headers),
      );
      print(response.data);
      if (response.statusCode == 200) {
        return srReciveModelFromJson(jsonEncode(response.data));
      }
      return null;
    } catch (e) {
      print("Unexpected Error: $e");
      return null;
    }
  }

  static Future<SrReciveModel?> srDeniedApi() async {
    try {
      final response = await dio.get(
        '$baseUrl/denied/$userID',
        options: Options(headers: headers),
      );
      print(response.data);
      if (response.statusCode == 200) {
        return srReciveModelFromJson(jsonEncode(response.data));
      }
      return null;
    } catch (e) {
      print("Unexpected Error: $e");
      return null;
    }
  }
}
