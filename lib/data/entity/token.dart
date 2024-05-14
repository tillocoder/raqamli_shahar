class TokenModel {
  final String refresh;

  TokenModel({
    required this.refresh,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        refresh: json["refresh"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
      };
  @override
  String toString() {
    return 'refresh:$refresh';
  }
}
