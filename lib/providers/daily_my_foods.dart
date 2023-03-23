import 'package:calori_tracker/model/item_model.dart';
import 'package:flutter/material.dart';

class DailyMyFoods extends ChangeNotifier{
  List<Items> _dailyMyFoods = [];
  List<Items> get dailyMyFoods => _dailyMyFoods;

  void addFood(Items food) {
    _dailyMyFoods.add(food);
    notifyListeners();
  }

  void removeFood(Items food) {
    _dailyMyFoods.remove(food);
    notifyListeners();
  }
}