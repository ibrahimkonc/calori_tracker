import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/item_model.dart';
import '../service/services.dart';

class HomeProvider extends ChangeNotifier {
  int dailyLimit =
      50; // Günlük Limit 5000 olarak ayarlanmıştır (dailyLimit/value)

  Services service = Services();
  List<Items> list = [];
  bool isGetProcress = false;
  Items homeProcress = Items(
      calories: 0, protein_g: 0, fat_total_g: 0, carbohydrates_total_g: 0);

  void getProgressData() async {
    if (isGetProcress == false) {
      homeProcress = Items(
          calories: 0, protein_g: 0, fat_total_g: 0, carbohydrates_total_g: 0);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userID = prefs.getString('uid') ?? "";
      list = await service.getFoodAll(userID) ?? [];
      for (var element in list) {
        homeProcress.calories = double.parse(element.calories.toString()) +
            double.parse(homeProcress.calories!.toStringAsFixed(2));

        homeProcress.protein_g = double.parse(element.protein_g.toString()) +
            double.parse(homeProcress.protein_g.toString());

        homeProcress.fat_total_g =
            double.parse(element.fat_total_g.toString()) +
                double.parse(homeProcress.fat_total_g.toString());

        homeProcress.carbohydrates_total_g =
            double.parse(element.carbohydrates_total_g.toString()) +
                double.parse(homeProcress.carbohydrates_total_g.toString());
      }
      isGetProcress = true;
      notifyListeners();
    }
  }
}
