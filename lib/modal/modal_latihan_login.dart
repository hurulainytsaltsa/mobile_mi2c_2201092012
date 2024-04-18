// To parse this JSON data, do
//
//     final modelLatihanLogin = modelLatihanLoginFromJson(jsonString);

import 'dart:convert';

ModelLatihanLogin modelLatihanLoginFromJson(String str) => ModelLatihanLogin.fromJson(json.decode(str));

String modelLatihanLoginToJson(ModelLatihanLogin data) => json.encode(data.toJson());

class ModelLatihanLogin {
  int value;
  String message;
  String username;
  String nama;
  String email;
  String nohp;
  String id;

  ModelLatihanLogin({
    required this.value,
    required this.message,
    required this.username,
    required this.nama,
    required this.email,
    required this.nohp,
    required this.id,
  });

  factory ModelLatihanLogin.fromJson(Map<String, dynamic> json) => ModelLatihanLogin(
    value: json["value"],
    message: json["message"],
    username: json["username"],
    nama: json["nama"],
    email: json["email"],
    nohp: json["nohp"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
    "username": username,
    "nama": nama,
    "email": email,
    "nohp": nohp,
    "id": id,
  };
}
