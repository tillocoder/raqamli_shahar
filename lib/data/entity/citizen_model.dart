// To parse this JSON data, do
//     final citizenModel = citizenModelFromJson(jsonString);
import 'dart:convert';

CitizenModel citizenModelFromJson(String str) =>
    CitizenModel.fromJson(json.decode(str));

String citizenModelToJson(CitizenModel data) => json.encode(data.toJson());

class CitizenModel {
  final String personalIdentification;
  final int house;
  final String phone;
  final int gender;
  final String fio;
  final String address;
  final String? lat;
  final String? lng;

  CitizenModel({
    required this.personalIdentification,
    required this.house,
    required this.phone,
    required this.gender,
    required this.fio,
    required this.address,
    required this.lat,
    required this.lng,
  });

  factory CitizenModel.fromJson(Map<String, dynamic> json) => CitizenModel(
        personalIdentification: json["personal_identification"],
        house: json["house"],
        phone: json["phone"],
        gender: json["gender"],
        fio: json["fio"],
        address: json["address"],
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "personal_identification": personalIdentification,
        "house": house,
        "phone": phone,
        "gender": gender,
        "fio": fio,
        "address": address,
        "lat": lat,
        "lng": lng,
      };
}
