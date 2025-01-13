// To parse this JSON data, do
//
//     final serviceRequestSendModel = serviceRequestSendModelFromJson(jsonString);

import 'dart:convert';

ServiceRequestSendModel serviceRequestSendModelFromJson(String str) =>
    ServiceRequestSendModel.fromJson(json.decode(str));

String serviceRequestSendModelToJson(ServiceRequestSendModel data) =>
    json.encode(data.toJson());

class ServiceRequestSendModel {
  String srType;
  String details;
  String isAreaIdentified;
  String userId;

  ServiceRequestSendModel({
    required this.srType,
    required this.details,
    required this.isAreaIdentified,
    required this.userId,
  });

  ServiceRequestSendModel copyWith({
    String? srType,
    String? details,
    String? isAreaIdentified,
    String? userId,
  }) =>
      ServiceRequestSendModel(
        srType: srType ?? this.srType,
        details: details ?? this.details,
        isAreaIdentified: isAreaIdentified ?? this.isAreaIdentified,
        userId: userId ?? this.userId,
      );

  factory ServiceRequestSendModel.fromJson(Map<String, dynamic> json) =>
      ServiceRequestSendModel(
        srType: json["sr_type"],
        details: json["details"],
        isAreaIdentified: json["is_area_identified"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "sr_type": srType,
        "details": details,
        "is_area_identified": isAreaIdentified,
        "user_id": userId,
      };
}
