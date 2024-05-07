class Activities {
  final List<Citizen> citizen;

  Activities({
    required this.citizen,
  });

  factory Activities.fromJson(Map<String, dynamic> json) => Activities(
        citizen: List<Citizen>.from(json["citizen"].map((x) => Citizen.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "citizen": List<dynamic>.from(citizen.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'Activities(citizen: $citizen)';
  }
}

class Citizen {
  final int id;
  final String houseQuantity;
  final String area;
  final double value;
  final String executionTime;
  final String income;
  final int citizen;
  final int direction;

  Citizen({
    required this.id,
    required this.houseQuantity,
    required this.area,
    required this.value,
    required this.executionTime,
    required this.income,
    required this.citizen,
    required this.direction,
  });

  factory Citizen.fromJson(Map<String, dynamic> json) => Citizen(
        id: json["id"],
        houseQuantity: json["house_quantity"],
        area: json["area"],
        value: json["value"],
        executionTime: json["execution_time"],
        income: json["income"],
        citizen: json["citizen"],
        direction: json["direction"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
    return 'Citizen(id: $id, houseQuantity: $houseQuantity, area: $area, value: $value, executionTime: $executionTime, income: $income, citizen: $citizen, direction: $direction)';
  }
}
