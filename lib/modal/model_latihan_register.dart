// To parse this JSON data, do
//
//     final modelLatihanRegister = modelLatihanRegisterFromJson(jsonString);

import 'dart:convert';

ModelLatihanRegister modelLatihanRegisterFromJson(String str) => ModelLatihanRegister.fromJson(json.decode(str));

String modelLatihanRegisterToJson(ModelLatihanRegister data) => json.encode(data.toJson());

class ModelLatihanRegister {
  int value;
  String message;

  ModelLatihanRegister({
    required this.value,
    required this.message,
  });

  factory ModelLatihanRegister.fromJson(Map<String, dynamic> json) => ModelLatihanRegister(
    value: json["value"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
  };
}
