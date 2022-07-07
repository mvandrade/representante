// To parse this JSON data, do
//
//     final peopleModel = peopleModelFromMap(jsonString);

import 'dart:convert';

import 'package:recorrente/models/base_model.dart';

class PeopleModel extends BaseModel {
  PeopleModel({
    uid,
    createdAt,
    updatedAt,
    deletedAt,
    required this.name,
    required this.entityType,
    required this.nationalRegister,
    required this.type,
    required this.email,
    required this.cellPhone,
    required this.contactName,
    required this.status,
  }) : super(
            uid: uid,
            createdAt: createdAt,
            updateAt: updatedAt,
            deletedAt: deletedAt);

  String name;
  String entityType;
  String nationalRegister;
  String type;
  String email;
  String cellPhone;
  String contactName;
  String status;

  factory PeopleModel.fromJson(String str) =>
      PeopleModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PeopleModel.fromMap(Map<String, dynamic> json) => PeopleModel(
        name: json["name"],
        entityType: json["entityType"],
        nationalRegister: json["nationalRegister"],
        type: json["type"],
        email: json["email"],
        cellPhone: json["cellPhone"],
        contactName: json["contactName"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "entityType": entityType,
        "nationalRegister": nationalRegister,
        "type": type,
        "email": email,
        "cellPhone": cellPhone,
        "contactName": contactName,
        "status": status,
      };
}
