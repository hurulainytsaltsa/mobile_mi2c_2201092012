// To parse this JSON data, do
//
//     final modelLatihanBerita = modelLatihanBeritaFromJson(jsonString);

import 'dart:convert';

ModelLatihanBerita modelLatihanBeritaFromJson(String str) => ModelLatihanBerita.fromJson(json.decode(str));

String modelLatihanBeritaToJson(ModelLatihanBerita data) => json.encode(data.toJson());

class ModelLatihanBerita {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelLatihanBerita({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelLatihanBerita.fromJson(Map<String, dynamic> json) => ModelLatihanBerita(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String judul;
  String berita;
  String gambar;

  Datum({
    required this.id,
    required this.judul,
    required this.berita,
    required this.gambar,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    judul: json["judul"],
    berita: json["berita"],
    gambar: json["gambar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "judul": judul,
    "berita": berita,
    "gambar": gambar,
  };
}
