import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lotuspmc/model/wt/wt_all.dart';
import 'package:lotuspmc/model/wt/wt_complete.dart';
import 'package:lotuspmc/model/wt/wt_denied.dart';
import 'package:lotuspmc/model/wt/wt_open.dart';
import 'package:path_provider/path_provider.dart';

import 'common.dart';

final dio = Dio();

var baseUrl = 'http://sahedstar.xyz/api/report';

class ApiServiceWT {
  static Future<WtAllModel?> wtAllApi() async {
    try {
      final response = await dio.get(
        '$baseUrl/all/$userID',
        options: Options(headers: headers),
      );
      print(response.data);
      if (response.statusCode == 200) {
        return wtAllModelFromJson(jsonEncode(response.data));
      }
      return null;
    } catch (e) {
      print("Unexpected Error: $e");
      return null;
    }
  }

  static Future<String?> wtGetPdfApi(int reportID) async {
    print('Fetching PDF for report: $reportID');
    try {
      final response = await dio.get(
        '$baseUrl/generate/$reportID',
        options: Options(
          headers: headers,
          responseType: ResponseType.bytes,
        ),
      );

      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/report_$reportID.pdf';
        final file = File(filePath);
        await file.writeAsBytes(response.data);

        return filePath;
      }

      return null;
    } catch (e) {
      print("Unexpected Error: $e");
      return null;
    }
  }

  static Future<WtOpenModel?> wtOpenApi() async {
    try {
      final response = await dio.get(
        '$baseUrl/open/$userID',
        options: Options(headers: headers),
      );
      print(response.data);
      if (response.statusCode == 200) {
        return wtOpenModelFromJson(jsonEncode(response.data));
      }
      return null;
    } catch (e) {
      print("Unexpected Error: $e");
      return null;
    }
  }

  static Future<WtCompletedModel?> wtCompletedApi() async {
    try {
      final response = await dio.get(
        '$baseUrl/completed/$userID',
        options: Options(headers: headers),
      );
      print(response.data);
      if (response.statusCode == 200) {
        return wtCompletedModelFromJson(jsonEncode(response.data));
      }
      return null;
    } catch (e) {
      print("Unexpected Error: $e");
      return null;
    }
  }

  static Future<WtDeniedModel?> wtDeniedApi() async {
    try {
      final response = await dio.get(
        '$baseUrl/denied/$userID',
        options: Options(headers: headers),
      );
      print(response.data);
      if (response.statusCode == 200) {
        return wtDeniedModelFromJson(jsonEncode(response.data));
      }
      return null;
    } catch (e) {
      print("Unexpected Error: $e");
      return null;
    }
  }
}
