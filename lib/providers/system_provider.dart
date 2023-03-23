import 'package:calori_tracker/components/radial_progress.dart';
import 'package:flutter/material.dart';

class SystemProvider with ChangeNotifier {
  int pageIndex = 1;

  List<Widget> pages = [
    Scaffold(
      body: Container(
        color: Colors.black87,
        child: const Center(
          child: Text(
            "1",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
      ),
    ),
    const Scaffold(body: RadialProgressPage()),
    Scaffold(
      body: Container(
        color: Colors.black87,
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
}
