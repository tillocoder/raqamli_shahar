// To parse this JSON data, do

import 'dart:convert';

List<CitizenModel> citizenModelFromJson(String str) => List<CitizenModel>.from(
      json.decode(str).map(
            (x) => CitizenModel.fromJson(x),
          ),
    );

String citizenModelToJson(List<CitizenModel> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class CitizenModel {
  final int? id;
  final String personalIdentification;
  final String passportNumber;
  final int house;
  final String phone;
  final int gender;
  final String fio;
  final String address;
  final String lat;
  final String lng;

  CitizenModel({
    required this.id,
    required this.personalIdentification,
    required this.passportNumber,
    required this.house,
    required this.phone,
    required this.gender,
    required this.fio,
    required this.address,
    required this.lat,
    required this.lng,
  });

  factory CitizenModel.fromJson(Map<String, dynamic> json) => CitizenModel(
        id: json["id"] ?? '',
        personalIdentification: json["personal_identification"] ?? "",
        passportNumber: json["passport_number"] ?? "",
        house: json["house"] ?? "",
        phone: json["phone"] ?? "",
        gender: json["gender"] ?? "",
        fio: json["fio"] ?? "",
        address: json["address"] ?? "",
        lat: json["lat"] ?? "",
        lng: json["lng"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "personal_identification": personalIdentification,
        "passport_number": passportNumber,
        "house": house,
        "phone": phone,
        "gender": gender,
        "fio": fio,
        "address": address,
        "lat": lat,
        "lng": lng,
      };
}
