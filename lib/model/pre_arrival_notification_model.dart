// To parse this JSON data, do
//
//     final preArrivalNotificationSendModel = preArrivalNotificationSendModelFromJson(jsonString);

import 'dart:convert';

PreArrivalNotificationSendModel preArrivalNotificationSendModelFromJson(
        String str) =>
    PreArrivalNotificationSendModel.fromJson(json.decode(str));

String preArrivalNotificationSendModelToJson(
        PreArrivalNotificationSendModel data) =>
    json.encode(data.toJson());

class PreArrivalNotificationSendModel {
  String date;
  String time;
  String userId;

  PreArrivalNotificationSendModel({
    required this.date,
    required this.time,
    required this.userId,
  });

  PreArrivalNotificationSendModel copyWith({
    String? date,
    String? time,
    String? userId,
  }) =>
      PreArrivalNotificationSendModel(
        date: date ?? this.date,
        time: time ?? this.time,
        userId: userId ?? this.userId,
      );

  factory PreArrivalNotificationSendModel.fromJson(Map<String, dynamic> json) =>
      PreArrivalNotificationSendModel(
        date: json["date"],
        time: json["time"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "time": time,
        "user_id": userId,
      };
}
