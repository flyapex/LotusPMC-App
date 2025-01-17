// To parse this JSON data, do
//
//     final srSendModel = srSendModelFromJson(jsonString);

import 'dart:convert';

SrSendModel srSendModelFromJson(String str) =>
    SrSendModel.fromJson(json.decode(str));

String srSendModelToJson(SrSendModel data) => json.encode(data.toJson());

class SrSendModel {
  String? srType;
  String? details;
  String? userId;
  String? propertyGrounds;
  String? residenceExterior;
  String? residenceInterior;
  String? roomDesignation;
  String? housekeeping;
  String? stormPreparedness;

  SrSendModel({
    this.srType,
    this.details,
    this.userId,
    this.propertyGrounds,
    this.residenceExterior,
    this.residenceInterior,
    this.roomDesignation,
    this.housekeeping,
    this.stormPreparedness,
  });

  factory SrSendModel.fromJson(Map<String, dynamic> json) => SrSendModel(
        srType: json["sr_type"],
        details: json["details"],
        userId: json["user_id"],
        propertyGrounds: json["property_grounds"],
        residenceExterior: json["residence_exterior"],
        residenceInterior: json["residence_interior"],
        roomDesignation: json["room_designation"],
        housekeeping: json["housekeeping"],
        stormPreparedness: json["storm_preparedness"],
      );

  Map<String, dynamic> toJson() => {
        "sr_type": srType,
        "details": details,
        "user_id": userId,
        "property_grounds": propertyGrounds,
        "residence_exterior": residenceExterior,
        "residence_interior": residenceInterior,
        "room_designation": roomDesignation,
        "housekeeping": housekeeping,
        "storm_preparedness": stormPreparedness,
      };
}
