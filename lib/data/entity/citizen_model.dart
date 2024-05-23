import 'dart:convert';

CitizenModel citizenModelFromJson(String str) =>
    CitizenModel.fromJson(json.decode(str));

String citizenModelToJson(CitizenModel data) => json.encode(data.toJson());

class CitizenModel {
  final int count;
  final String? next; // Nullable type
  final String? previous; // Nullable type
  final List<Result> results;

  CitizenModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory CitizenModel.fromJson(Map<String, dynamic> json) => CitizenModel(
        count: json["count"] ?? 0,
        next: json["next"] as String?,
        previous: json["previous"] as String?,
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  final int id;
  final String passportNumber;
  final String personalIdentification;
  final int house;
  final String phone;
  final int gender;
  final int mahalla;
  final String fio;
  final int region;
  final int birthday;
  final String address;
  final int leaderTadbirkor;
  final int bandlikXolati;
  final int ishDaraja;
  final int soxa;
  final int ijtimoiyHolati;
  final int bandlik;
  final double certificateNumber;
  final String lat;
  final String lng;

  Result({
    required this.id,
    required this.passportNumber,
    required this.personalIdentification,
    required this.house,
    required this.phone,
    required this.gender,
    required this.mahalla,
    required this.fio,
    required this.region,
    required this.birthday,
    required this.address,
    required this.leaderTadbirkor,
    required this.bandlikXolati,
    required this.ishDaraja,
    required this.soxa,
    required this.ijtimoiyHolati,
    required this.bandlik,
    required this.certificateNumber,
    required this.lat,
    required this.lng,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        passportNumber: json["passport_number"] ?? '',
        personalIdentification: json["personal_identification"] ?? '',
        house: json["house"] is int
            ? json["house"]
            : int.tryParse(json["house"]?.toString() ?? '') ?? 0,
        phone: json["phone"] ?? '',
        gender: json["gender"] is int
            ? json["gender"]
            : int.tryParse(json["gender"]?.toString() ?? '') ?? 0,
        mahalla: json["mahalla"] is int
            ? json["mahalla"]
            : int.tryParse(json["mahalla"]?.toString() ?? '') ?? 0,
        fio: json["fio"] ?? '',
        region: json["region"] is int
            ? json["region"]
            : int.tryParse(json["region"]?.toString() ?? '') ?? 0,
        birthday: json["birthday"] is int
            ? json["birthday"]
            : int.tryParse(json["birthday"]?.toString() ?? '') ?? 0,
        address: json["address"] ?? '',
        leaderTadbirkor: json["leader_tadbirkor"] is int
            ? json["leader_tadbirkor"]
            : int.tryParse(json["leader_tadbirkor"]?.toString() ?? '') ?? 0,
        bandlikXolati: json["bandlik_xolati"] is int
            ? json["bandlik_xolati"]
            : int.tryParse(json["bandlik_xolati"]?.toString() ?? '') ?? 0,
        ishDaraja: json["ish_daraja"] is int
            ? json["ish_daraja"]
            : int.tryParse(json["ish_daraja"]?.toString() ?? '') ?? 0,
        soxa: json["soxa"] is int
            ? json["soxa"]
            : int.tryParse(json["soxa"]?.toString() ?? '') ?? 0,
        ijtimoiyHolati: json["ijtimoiy_holati"] is int
            ? json["ijtimoiy_holati"]
            : int.tryParse(json["ijtimoiy_holati"]?.toString() ?? '') ?? 0,
        bandlik: json["bandlik"] is int
            ? json["bandlik"]
            : int.tryParse(json["bandlik"]?.toString() ?? '') ?? 0,
        certificateNumber:
            (json["certificate_number"] as num?)?.toDouble() ?? 0.0,
        lat: json["lat"] ?? '',
        lng: json["lng"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "passport_number": passportNumber,
        "personal_identification": personalIdentification,
        "house": house,
        "phone": phone,
        "gender": gender,
        "mahalla": mahalla,
        "fio": fio,
        "region": region,
        "birthday": birthday,
        "address": address,
        "leader_tadbirkor": leaderTadbirkor,
        "bandlik_xolati": bandlikXolati,
        "ish_daraja": ishDaraja,
        "soxa": soxa,
        "ijtimoiy_holati": ijtimoiyHolati,
        "bandlik": bandlik,
        "certificate_number": certificateNumber,
        "lat": lat,
        "lng": lng,
      };
}
