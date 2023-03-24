// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int? id;
  int? age;
  double? height;
  double? weight;
  String? firstName;
  String? lastName;
  User({
    this.id,
    this.age,
    this.height,
    this.weight,
    this.firstName,
    this.lastName,
  });


  User copyWith({
    int? id,
    int? age,
    double? height,
    double? weight,
    String? firstName,
    String? lastName,
  }) {
    return User(
      id: id ?? this.id,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'age': age,
      'height': height,
      'weight': weight,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      age: map['age'] != null ? map['age'] as int : null,
      height: map['height'] != null ? map['height'] as double : null,
      weight: map['weight'] != null ? map['weight'] as double : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, age: $age, height: $height, weight: $weight, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.age == age &&
      other.height == height &&
      other.weight == weight &&
      other.firstName == firstName &&
      other.lastName == lastName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      age.hashCode ^
      height.hashCode ^
      weight.hashCode ^
      firstName.hashCode ^
      lastName.hashCode;
  }
}
