import 'package:flutter/material.dart';

class SystemProvider with ChangeNotifier {
  void ok() {
    notifyListeners();
  }
}
