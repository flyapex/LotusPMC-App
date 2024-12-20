// To parse this JSON data, do
//
//     final propertyInformationResponse = propertyInformationResponseFromJson(jsonString);

import 'dart:convert';

PropertyInformationResponse propertyInformationResponseFromJson(String str) =>
    PropertyInformationResponse.fromJson(json.decode(str));

String propertyInformationResponseToJson(PropertyInformationResponse data) =>
    json.encode(data.toJson());

class PropertyInformationResponse {
  bool success;
  String message;
  Data data;

  PropertyInformationResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  PropertyInformationResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      PropertyInformationResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory PropertyInformationResponse.fromJson(Map<String, dynamic> json) =>
      PropertyInformationResponse(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  int id;
  String address;
  String sizeOfHome;
  String numberOfStories;
  String constructionType;
  String hasPool;
  String poolType;
  String gatedCommunity;
  String yearBuilt;
  String impactWindows;
  String hasHoa;
  String gatedProperty;
  String contactName;
  String contactEmail;
  String contactCell;
  String preferredContactMethod;
  String managerId;
  String tenantIds;
  String contactedIds;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> floors;
  Manager manager;

  Data({
    required this.id,
    required this.address,
    required this.sizeOfHome,
    required this.numberOfStories,
    required this.constructionType,
    required this.hasPool,
    required this.poolType,
    required this.gatedCommunity,
    required this.yearBuilt,
    required this.impactWindows,
    required this.hasHoa,
    required this.gatedProperty,
    required this.contactName,
    required this.contactEmail,
    required this.contactCell,
    required this.preferredContactMethod,
    required this.managerId,
    required this.tenantIds,
    required this.contactedIds,
    required this.createdAt,
    required this.updatedAt,
    required this.floors,
    required this.manager,
  });

  Data copyWith({
    int? id,
    String? address,
    String? sizeOfHome,
    String? numberOfStories,
    String? constructionType,
    String? hasPool,
    String? poolType,
    String? gatedCommunity,
    String? yearBuilt,
    String? impactWindows,
    String? hasHoa,
    String? gatedProperty,
    String? contactName,
    String? contactEmail,
    String? contactCell,
    String? preferredContactMethod,
    String? managerId,
    String? tenantIds,
    String? contactedIds,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<dynamic>? floors,
    Manager? manager,
  }) =>
      Data(
        id: id ?? this.id,
        address: address ?? this.address,
        sizeOfHome: sizeOfHome ?? this.sizeOfHome,
        numberOfStories: numberOfStories ?? this.numberOfStories,
        constructionType: constructionType ?? this.constructionType,
        hasPool: hasPool ?? this.hasPool,
        poolType: poolType ?? this.poolType,
        gatedCommunity: gatedCommunity ?? this.gatedCommunity,
        yearBuilt: yearBuilt ?? this.yearBuilt,
        impactWindows: impactWindows ?? this.impactWindows,
        hasHoa: hasHoa ?? this.hasHoa,
        gatedProperty: gatedProperty ?? this.gatedProperty,
        contactName: contactName ?? this.contactName,
        contactEmail: contactEmail ?? this.contactEmail,
        contactCell: contactCell ?? this.contactCell,
        preferredContactMethod:
            preferredContactMethod ?? this.preferredContactMethod,
        managerId: managerId ?? this.managerId,
        tenantIds: tenantIds ?? this.tenantIds,
        contactedIds: contactedIds ?? this.contactedIds,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        floors: floors ?? this.floors,
        manager: manager ?? this.manager,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        address: json["address"],
        sizeOfHome: json["size_of_home"],
        numberOfStories: json["number_of_stories"],
        constructionType: json["construction_type"],
        hasPool: json["has_pool"],
        poolType: json["pool_type"],
        gatedCommunity: json["gated_community"],
        yearBuilt: json["year_built"],
        impactWindows: json["impact_windows"],
        hasHoa: json["has_hoa"],
        gatedProperty: json["gated_property"],
        contactName: json["contact_name"],
        contactEmail: json["contact_email"],
        contactCell: json["contact_cell"],
        preferredContactMethod: json["preferred_contact_method"],
        managerId: json["manager_id"],
        tenantIds: json["tenant_ids"],
        contactedIds: json["contacted_ids"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        floors: List<dynamic>.from(json["floors"].map((x) => x)),
        manager: Manager.fromJson(json["manager"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "size_of_home": sizeOfHome,
        "number_of_stories": numberOfStories,
        "construction_type": constructionType,
        "has_pool": hasPool,
        "pool_type": poolType,
        "gated_community": gatedCommunity,
        "year_built": yearBuilt,
        "impact_windows": impactWindows,
        "has_hoa": hasHoa,
        "gated_property": gatedProperty,
        "contact_name": contactName,
        "contact_email": contactEmail,
        "contact_cell": contactCell,
        "preferred_contact_method": preferredContactMethod,
        "manager_id": managerId,
        "tenant_ids": tenantIds,
        "contacted_ids": contactedIds,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "floors": List<dynamic>.from(floors.map((x) => x)),
        "manager": manager.toJson(),
      };
}

class Manager {
  int id;
  String fName;
  String lName;
  String email;
  String phoneNumber;
  String city;
  String address;
  dynamic note;
  dynamic emailVerifiedAt;
  String userType;
  DateTime createdAt;
  DateTime updatedAt;

  Manager({
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.phoneNumber,
    required this.city,
    required this.address,
    required this.note,
    required this.emailVerifiedAt,
    required this.userType,
    required this.createdAt,
    required this.updatedAt,
  });

  Manager copyWith({
    int? id,
    String? fName,
    String? lName,
    String? email,
    String? phoneNumber,
    String? city,
    String? address,
    dynamic note,
    dynamic emailVerifiedAt,
    String? userType,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Manager(
        id: id ?? this.id,
        fName: fName ?? this.fName,
        lName: lName ?? this.lName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        city: city ?? this.city,
        address: address ?? this.address,
        note: note ?? this.note,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        userType: userType ?? this.userType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Manager.fromJson(Map<String, dynamic> json) => Manager(
        id: json["id"],
        fName: json["f_name"],
        lName: json["l_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        city: json["city"],
        address: json["address"],
        note: json["note"],
        emailVerifiedAt: json["email_verified_at"],
        userType: json["user_type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "f_name": fName,
        "l_name": lName,
        "email": email,
        "phone_number": phoneNumber,
        "city": city,
        "address": address,
        "note": note,
        "email_verified_at": emailVerifiedAt,
        "user_type": userType,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
