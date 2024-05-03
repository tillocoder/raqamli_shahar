import 'dart:convert';

List<UsersList> usersListFromJson(String str) =>
    List<UsersList>.from(json.decode(str).map((x) => UsersList.fromJson(x)));

String usersListToJson(List<UsersList> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class UsersList {
  final int id;
  final dynamic personalIdentification;
  final int house;
  final String phone;
  final int gender;
  final String fio;
  final String address;

  UsersList({
    required this.id,
    this.personalIdentification,
    required this.house,
    required this.phone,
    required this.gender,
    required this.fio,
    required this.address,
  });

  factory UsersList.fromJson(Map<String, dynamic> json) => UsersList(
        id: json["id"],
        personalIdentification: json["personal_identification"] ?? "",
        house: json["house"],
        phone: json["phone"],
        gender: json["gender"],
        fio: json["fio"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "personal_identification": personalIdentification,
        "house": house,
        "phone": phone,
        "gender": gender,
        "fio": fio,
        "address": address,
      };
}
