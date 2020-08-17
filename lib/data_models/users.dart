class User {
  final int id;
  final String name;
  final int year;
  final String color;
  final String pantoneValue;

  User({
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
  });

  // named constructor
  factory User.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to User");
    }

    return User(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      color: json['color'],
      pantoneValue: json['pantone_value'],
    );
  }

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
