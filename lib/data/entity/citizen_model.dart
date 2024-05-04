class CitizenModel {
  final int? id;
  final dynamic personalIdentification;
  final String house;
  final String phone;
  final String gender;
  final String fio;
  final String address;
  final String lat;
  final String lng;

  CitizenModel({
    this.id,
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
        id: json["id"],
        personalIdentification: json["personalIdentification"],
        house: json["house"],
        phone: json["phone"],
        gender: json["gender"],
        fio: json["fio"],
        address: json["address"],
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "personalIdentification": personalIdentification,
        "house": house,
        "phone": phone,
        "gender": gender,
        "fio": fio,
        "address": address,
        "lat": lat,
        "lng": lng,
      };

  @override
  String toString() {
    return 'Citizen { id: $id, personalIdentification: $personalIdentification, house: $house, phone: $phone, gender: $gender, fio: $fio, address: $address }';
  }
}
