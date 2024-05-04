class Directions {
  final int id;
  final String name;

  Directions({
    required this.id,
    required this.name,
  });

  factory Directions.fromJson(Map<String, dynamic> json) => Directions(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
  @override
  String toString() {
    return 'Direction id:$id name:$name';
  }
}
