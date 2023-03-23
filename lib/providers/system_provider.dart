import 'package:calori_tracker/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SystemProvider with ChangeNotifier {
  int pageIndex = 2;

  List<Widget> pages = [
    Scaffold(
      body: Container(
        child: const Center(
          child: Text(
            "1",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
      ),
    ),
    const HomePage(),
    Scaffold(
      body: Container(
        child: const Center(
          child: Text(
            "3",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
      ),
    ),
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
