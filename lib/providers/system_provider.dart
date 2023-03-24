import 'package:calori_tracker/screens/home.dart';
import 'package:calori_tracker/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/news_screen.dart';

class SystemProvider with ChangeNotifier {
  int pageIndex = 2;

  List<Widget> pages = [
    const NewsScreen(),
    const HomePage(),
    const SliverProfilePage(),
  ];

  void route(int value) {
    pageIndex = value;
    notifyListeners();
  }

  void sessionChange(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', id);
    route(0);
  }
}
