// import 'package:json_serializable/json_serializable.dart';
// part 'user.g.dart';
// @JsonSerializable(nullable: false)

class User {
  final int id;
  final String name;
  final int year;
  final String color;
  // @JsonKey(name: 'pantone_value')
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

  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  //  Map<String, dynamic> toJson() => _$UserToJson(this);

}
