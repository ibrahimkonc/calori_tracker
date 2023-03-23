import 'package:calori_tracker/screens/home.dart';
import 'package:flutter/material.dart';

import '../screens/login.dart';

class SystemProvider with ChangeNotifier {
  int pageIndex = 1;

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
    LoginPage()
  ];
  void route(int value) {
    pageIndex = value;
    notifyListeners();
  }
}
