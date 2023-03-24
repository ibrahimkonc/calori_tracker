import 'package:calori_tracker/model/item_model.dart';
import 'package:calori_tracker/service/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyMyFoods extends ChangeNotifier {
  List<Items?> _dailyMyFoods = [];
  Items nullData = Items();
  List<Items?> get dailyMyFoods => _dailyMyFoods;
  var services = Services();

  void getDailyMyFoods(int category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userID = prefs.getString('uid') ?? "";
    if (userID != "" && category != "") {
      _dailyMyFoods =
          (await services.getFoodById(userID, category) ?? []) as List<Items?>;
    }
    notifyListeners();
  }

  Future<bool> addFood(Items food, int category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userID = prefs.getString('uid') ?? "";
    if (userID != "") {
      String response = await services.addFoodPost(food, userID, category);
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

  Future<bool> removeFood(Items food, int category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userID = prefs.getString('uid') ?? "";
    if (userID != "") {
      String response = await services.addFoodPost(food, userID, category);
      if (response != "") {
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    }
    return false;
  }
}
