// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Items {
  String? name;
  double? calories;
  double? serving_size_g;
  double? fat_total_g;
  double? fat_saturated_g;
  double? protein_g;
  int? sodium_mg;
  int? potassium_mg;
  int? cholesterol_mg;
  double? carbohydrates_total_g;
  double? fiber_g;
  double? sugar_g;
  Items({
    this.name,
    this.calories,
    this.serving_size_g,
    this.fat_total_g,
    this.fat_saturated_g,
    this.protein_g,
    this.sodium_mg,
    this.potassium_mg,
    this.cholesterol_mg,
    this.carbohydrates_total_g,
    this.fiber_g,
    this.sugar_g,
  });

  Items copyWith({
    String? name,
    double? calories,
    double? serving_size_g,
    double? fat_total_g,
    double? fat_saturated_g,
    double? protein_g,
    int? sodium_mg,
    int? potassium_mg,
    int? cholesterol_mg,
    double? carbohydrates_total_g,
    double? fiber_g,
    double? sugar_g,
  }) {
    return Items(
      name: name ?? this.name,
      calories: calories ?? this.calories,
      serving_size_g: serving_size_g ?? this.serving_size_g,
      fat_total_g: fat_total_g ?? this.fat_total_g,
      fat_saturated_g: fat_saturated_g ?? this.fat_saturated_g,
      protein_g: protein_g ?? this.protein_g,
      sodium_mg: sodium_mg ?? this.sodium_mg,
      potassium_mg: potassium_mg ?? this.potassium_mg,
      cholesterol_mg: cholesterol_mg ?? this.cholesterol_mg,
      carbohydrates_total_g:
          carbohydrates_total_g ?? this.carbohydrates_total_g,
      fiber_g: fiber_g ?? this.fiber_g,
      sugar_g: sugar_g ?? this.sugar_g,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'calories': calories,
      'serving_size_g': serving_size_g,
      'fat_total_g': fat_total_g,
      'fat_saturated_g': fat_saturated_g,
      'protein_g': protein_g,
      'sodium_mg': sodium_mg,
      'potassium_mg': potassium_mg,
      'cholesterol_mg': cholesterol_mg,
      'carbohydrates_total_g': carbohydrates_total_g,
      'fiber_g': fiber_g,
      'sugar_g': sugar_g,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      name: map['name'] != null ? map['name'] as String : null,
      calories: map['calories'] != null ? map['calories'] as double : null,
      serving_size_g: map['serving_size_g'] != null
          ? map['serving_size_g'] as double
          : null,
      fat_total_g:
          map['fat_total_g'] != null ? map['fat_total_g'] as double : null,
      fat_saturated_g: map['fat_saturated_g'] != null
          ? map['fat_saturated_g'] as double
          : null,
      protein_g: map['protein_g'] != null ? map['protein_g'] as double : null,
      sodium_mg: map['sodium_mg'] != null ? map['sodium_mg'] as int : null,
      potassium_mg:
          map['potassium_mg'] != null ? map['potassium_mg'] as int : null,
      cholesterol_mg:
          map['cholesterol_mg'] != null ? map['cholesterol_mg'] as int : null,
      carbohydrates_total_g: map['carbohydrates_total_g'] != null
          ? map['carbohydrates_total_g'] as double
          : null,
      fiber_g: map['fiber_g'] != null ? map['fiber_g'] as double : null,
      sugar_g: map['sugar_g'] != null ? map['sugar_g'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) =>
      Items.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Items(name: $name, calories: $calories, serving_size_g: $serving_size_g, fat_total_g: $fat_total_g, fat_saturated_g: $fat_saturated_g, protein_g: $protein_g, sodium_mg: $sodium_mg, potassium_mg: $potassium_mg, cholesterol_mg: $cholesterol_mg, carbohydrates_total_g: $carbohydrates_total_g, fiber_g: $fiber_g, sugar_g: $sugar_g)';
  }

  @override
  bool operator ==(covariant Items other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.calories == calories &&
        other.serving_size_g == serving_size_g &&
        other.fat_total_g == fat_total_g &&
        other.fat_saturated_g == fat_saturated_g &&
        other.protein_g == protein_g &&
        other.sodium_mg == sodium_mg &&
        other.potassium_mg == potassium_mg &&
        other.cholesterol_mg == cholesterol_mg &&
        other.carbohydrates_total_g == carbohydrates_total_g &&
        other.fiber_g == fiber_g &&
        other.sugar_g == sugar_g;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        calories.hashCode ^
        serving_size_g.hashCode ^
        fat_total_g.hashCode ^
        fat_saturated_g.hashCode ^
        protein_g.hashCode ^
        sodium_mg.hashCode ^
        potassium_mg.hashCode ^
        cholesterol_mg.hashCode ^
        carbohydrates_total_g.hashCode ^
        fiber_g.hashCode ^
        sugar_g.hashCode;
  }
}
