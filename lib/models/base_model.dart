// To parse this JSON data, do
//
//     final baseModel = baseModelFromMap(jsonString);

import 'dart:convert';

class BaseModel {
    BaseModel({
        required this.uid,
        required this.createdAt,
        required this.updateAt,
        this.deletedAt,
    });

    String uid;
    DateTime createdAt;
    String updateAt;
    DateTime? deletedAt;

    factory BaseModel.fromJson(String str) => BaseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BaseModel.fromMap(Map<String, dynamic> json) => BaseModel(
        uid: json["uid"],
        createdAt: DateTime.parse(json["createdAt"]),
        updateAt: json["updateAt"],
        deletedAt: DateTime.parse(json["deletedAt"]),
    );

    Map<String, dynamic> toMap() => {
        "uid": uid,
        "createdAt": createdAt.toIso8601String(),
        "updateAt": updateAt,
        "deletedAt": deletedAt,
    };
}
