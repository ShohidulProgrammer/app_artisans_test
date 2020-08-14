class User {
  final String id;
  final String name;
  final String year;
  final String color;
  final String pantoneValue;

  User({this.id, this.name, this.year, this.color, this.pantoneValue});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? "",
        name = json['name'] ?? "",
        year = json['year'] ?? "",
        color = json['color'] ?? "",
        pantoneValue = json['pantone_value'] ?? "";

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "year": year,
      "color": color,
      "pantone_value": pantoneValue,
    };
  }
}
