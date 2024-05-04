class CitizenModel {
  final int? id; // Make id nullable
  final dynamic personalIdentification;
  final int house;
  final String phone;
  final int gender;
  final String fio;
  final String address;
  // Other properties remain the same

  CitizenModel({
    this.id, // Change to nullable
    required this.personalIdentification,
    required this.house,
    required this.phone,
    required this.gender,
    required this.fio,
    required this.address,
  });

  factory CitizenModel.fromJson(Map<String, dynamic> json) => CitizenModel(
        id: json["id"], // No changes needed here, JSON data should contain "id" key
        personalIdentification: json["personal_identification"],
        house: json["house"],
        phone: json["phone"],
        gender: json["gender"],
        fio: json["fio"],
        address: json["address"],
      );

   Map<String, dynamic> toJson() => {
        "personal_identification": personalIdentification,
        "house": house,
        "phone": phone,
        "gender": gender,
        "fio": fio,
        "address": address,
    };

  @override
  String toString() {
    return 'Citizen { id: $id, personalIdentification: $personalIdentification, house: $house, phone: $phone, gender: $gender, fio: $fio, address: $address }';
  }
}
