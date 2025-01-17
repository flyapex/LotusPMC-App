import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:lotuspmc/api/common.dart';
import 'package:lotuspmc/model/common.dart';
import 'package:lotuspmc/model/cr/cr_send.dart';

final dio = Dio();

var baseUrl = 'http://sahedstar.xyz/api';

class ApiServicePAN {
  static Future<ResponseModel?> panSendApi(
    ConciergeRequestSendModel data,
  ) async {
    try {
      print(data.toJson());
      final response = await dio.post(
        '$baseUrl/pre-arrival-submit',
        data: conciergeRequestSendModelToJson(data),
        options: Options(headers: headers),
      );
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
}
