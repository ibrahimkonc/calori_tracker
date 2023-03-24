// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String? email;
  int? age;
  double? height;
  double? weight;
  String? name;
  User({
    this.email,
    this.age,
    this.height,
    this.weight,
    this.name,
  });

  User copyWith({
    String? email,
    int? age,
    double? height,
    double? weight,
    String? name,
  }) {
    return User(
      email: email ?? this.email,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'age': age,
      'height': height,
      'weight': weight,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] != null ? map['email'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      height: map['height'] != null ? map['height'] as double : null,
      weight: map['weight'] != null ? map['weight'] as double : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(email: $email, age: $age, height: $height, weight: $weight, name: $name)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.age == age &&
        other.height == height &&
        other.weight == weight &&
        other.name == name;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        age.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        name.hashCode;
  }
}
