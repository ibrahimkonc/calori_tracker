import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/item_model.dart';
import '../service/services.dart';

class HomeProvider extends ChangeNotifier {
  double calories = 0;
  double proteinG = 0;
  double fatTotalG = 0;
  double carbohydratesTotalG = 0;
  double c = 0, p = 0, f = 0, carb = 0;
  bool isLoading = false;
  
  int dailyLimit =
      50; // Günlük Limit 5000 olarak ayarlanmıştır (dailyLimit/value)
  double fatLimit = 100;
  double carbLimit = 310;
  double proteinLimit = 100;
  double caloriesLimit = 2000;

  Services service = Services();
  List<Items> list = [];
  // Items homeProcress = Items(
  //     calories: 0, protein_g: 0, fat_total_g: 0, carbohydrates_total_g: 0);
  setLoadTrue() {
    isLoading = true;
    notifyListeners();
  }

  setLoadFalse() {
    isLoading = false;
    notifyListeners();
  }

  void setAll(double c, double p, double f, double carb) {
    calories = c;
    proteinG = p;
    fatTotalG = f;
    carbohydratesTotalG = carb;
    notifyListeners();
  }

  void setTempsZero() {
    c = 0;
    p = 0;
    f = 0;
    carb = 0;
    notifyListeners();
  }

  void getProgressData() async {
    setLoadTrue();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userID = prefs.getString('uid') ?? "";
    list = await service.getFoodAll(userID) ?? []; //tum yemekler

    await Future.forEach(list, (element) async {
      c += double.parse(element.calories.toString());
      // double.parse(homeProcress.calories!.toStringAsFixed(2));

      p += double.parse(element.protein_g.toString());

      f += double.parse(element.fat_total_g.toString());

      carb += double.parse(element.carbohydrates_total_g.toString());
    });
    setAll(c, p, f, carb);
    setTempsZero();

    setLoadFalse();
    notifyListeners();
  }
}
