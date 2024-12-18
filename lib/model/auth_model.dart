// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String email;
  String password;

  LoginModel({
    required this.email,
    required this.password,
  });

  LoginModel copyWith({
    String? email,
    String? password,
  }) =>
      LoginModel(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  bool success;
  Data data;
  String message;

  LoginResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  LoginResponseModel copyWith({
    bool? success,
    Data? data,
    String? message,
  }) =>
      LoginResponseModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  String token;
  int id;
  String fName;
  String lName;
  String address;
  String city;
  String email;
  String phoneNumber;
  String userType;

  Data({
    required this.token,
    required this.id,
    required this.fName,
    required this.lName,
    required this.address,
    required this.city,
    required this.email,
    required this.phoneNumber,
    required this.userType,
  });

  Data copyWith({
    String? token,
    int? id,
    String? fName,
    String? lName,
    String? address,
    String? city,
    String? email,
    String? phoneNumber,
    String? userType,
  }) =>
      Data(
        token: token ?? this.token,
        id: id ?? this.id,
        fName: fName ?? this.fName,
        lName: lName ?? this.lName,
        address: address ?? this.address,
        city: city ?? this.city,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        userType: userType ?? this.userType,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        id: json["id"],
        fName: json["f_name"],
        lName: json["l_name"],
        address: json["address"],
        city: json["city"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        userType: json["user_type"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
        "f_name": fName,
        "l_name": lName,
        "address": address,
        "city": city,
        "email": email,
        "phone_number": phoneNumber,
        "user_type": userType,
      };
}
// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String fName;
  String lName;
  String address;
  String city;
  String email;
  String phoneNumber;
  String password;
  String cPassword;
  String note;

  RegisterModel({
    required this.fName,
    required this.lName,
    required this.address,
    required this.city,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.cPassword,
    required this.note,
  });

  RegisterModel copyWith({
    String? fName,
    String? lName,
    String? address,
    String? city,
    String? email,
    String? phoneNumber,
    String? password,
    String? cPassword,
    String? note,
  }) =>
      RegisterModel(
        fName: fName ?? this.fName,
        lName: lName ?? this.lName,
        address: address ?? this.address,
        city: city ?? this.city,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        cPassword: cPassword ?? this.cPassword,
        note: note ?? this.note,
      );

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        fName: json["f_name"],
        lName: json["l_name"],
        address: json["address"],
        city: json["city"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        password: json["password"],
        cPassword: json["c_password"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "f_name": fName,
        "l_name": lName,
        "address": address,
        "city": city,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
        "c_password": cPassword,
        "note": note,
      };
}
