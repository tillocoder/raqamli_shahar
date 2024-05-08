class Activities {
  final List<CitizenActivityAddModel> citizen;

  Activities({
    required this.citizen,
  });

  factory Activities.fromJson(Map<String, dynamic> json) => Activities(
        citizen: List<CitizenActivityAddModel>.from(
            json["citizen"].map((x) => CitizenActivityAddModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "citizen": List<dynamic>.from(citizen.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'Activities(citizen: $citizen)';
  }
}

class CitizenActivityAddModel {
  final String houseQuantity;
  final String area;
  final double value;
  final String executionTime;
  final String income;
  final int citizen;
  final int direction;

  CitizenActivityAddModel({
    required this.houseQuantity,
    required this.area,
    required this.value,
    required this.executionTime,
    required this.income,
    required this.citizen,
    required this.direction,
  });

  factory CitizenActivityAddModel.fromJson(Map<String, dynamic> json) =>
      CitizenActivityAddModel(
        houseQuantity: json["house_quantity"],
        area: json["area"],
        value: json["value"],
        executionTime: json["execution_time"],
        income: json["income"],
        citizen: json["citizen"],
        direction: json["direction"],
      );

  Map<String, dynamic> toJson() => {
        "house_quantity": houseQuantity,
        "area": area,
        "value": value,
        "execution_time": executionTime,
        "income": income,
        "citizen": citizen,
        "direction": direction,
      };

  @override
  String toString() {
    return 'Citizen(, houseQuantity: $houseQuantity, area: $area, value: $value, executionTime: $executionTime, income: $income, citizen: $citizen, direction: $direction)';
  }
}
