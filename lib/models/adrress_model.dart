// To parse this JSON data, do
//
//     final addressModel = addressModelFromMap(jsonString);S

import 'dart:convert';

import 'package:recorrente/models/base_model.dart';

class AddressModel extends BaseModel {
  AddressModel({
    uid,
    createdAt,
    updatedAt,
    deletedAt,
    required this.postalCode,
    required this.street,
    required this.number,
    required this.complemnt,
    required this.neighborhood,
    required this.city,
    required this.federativeUnit,
  }) : super(
            uid: uid,
            createdAt: createdAt,
            updateAt: updatedAt,
            deletedAt: deletedAt);

  String postalCode;
  String street;
  String number;
  String complemnt;
  String neighborhood;
  String city;
  String federativeUnit;

  factory AddressModel.fromJson(String str) =>
      AddressModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddressModel.fromMap(Map<String, dynamic> json) => AddressModel(
        postalCode: json["postal_code"],
        street: json["street"],
        number: json["number"],
        complemnt: json["complemnt"],
        neighborhood: json["neighborhood "],
        city: json["city"],
        federativeUnit: json["federative_unit"],
      );

  Map<String, dynamic> toMap() => {
        "postal_code": postalCode,
        "street": street,
        "number": number,
        "complemnt": complemnt,
        "neighborhood ": neighborhood,
        "city": city,
        "federative_unit": federativeUnit,
      };
}
