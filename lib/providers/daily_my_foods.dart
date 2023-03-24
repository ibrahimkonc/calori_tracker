import 'package:calori_tracker/model/item_model.dart';
import 'package:calori_tracker/service/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyMyFoods extends ChangeNotifier {
  List<Items> _dailyMyFoods = [];
  List<Items> get dailyMyFoods => _dailyMyFoods;

  var services = Services();

  Future<bool> addFood(Items food) async {
    _dailyMyFoods.add(food);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userID = prefs.getString('uid') ?? "";
    food.userID = userID;
    if (userID != "") {
      String response = await services.addFoodPost(food);
      if (response != "") {
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    }
    notifyListeners();
    return false;
  }

  void removeFood(Items food) {
    _dailyMyFoods.remove(food);
    notifyListeners();
  }
}
