import 'dart:convert';

List<SoxaModel> soxaModelFromJson(String str) =>
    List<SoxaModel>.from(json.decode(str).map((x) => SoxaModel.fromJson(x)));

String soxaModelToJson(List<SoxaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SoxaModel {
  final int id;
  final int status;
  final String name;

  SoxaModel({
    required this.id,
    required this.status,
    required this.name,
  });

  factory SoxaModel.fromJson(Map<String, dynamic> json) => SoxaModel(
        id: json["id"] ?? 0,
        status: json["status"] ?? 0,
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "name": name,
      };
}
