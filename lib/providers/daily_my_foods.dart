import 'package:calori_tracker/model/item_model.dart';
import 'package:calori_tracker/service/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyMyFoods extends ChangeNotifier {
  List<Items?> _dailyMyFoods = [];
  List<Items?> get dailyMyFoods => _dailyMyFoods;
  var services = Services();
  bool isActive = false;
  int category = 0;

  final TextEditingController searchController = TextEditingController();
  List<Items> searchList = [];
  Services service = Services();

  void getSearch(String query) async {
    searchList = await service.getSearch(query);
    notifyListeners();
  }

  void getDailyMyFoods(int category) async {
    if (isActive == false) {
      searchList.clear();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userID = prefs.getString('uid') ?? "";
      if (userID != "" && category != "") {
        _dailyMyFoods = (await services.getFoodById(userID, category) ?? [])
            as List<Items?>;
      }
      isActive = true;
      notifyListeners();
    }
  }

  Future<bool> addFood(Items food, int category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userID = prefs.getString('uid') ?? "";
    if (userID != "") {
      String response = await services.addFoodPost(food, userID, category);
      if (response != "") {
        getDailyMyFoods(category);
        isActive = false;
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
      bool response = await services.deleteFood(userID, category, food.foodID!);
      if (response) {
        _dailyMyFoods.remove(food);
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
