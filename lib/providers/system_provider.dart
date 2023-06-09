import 'package:calori_tracker/model/user_model.dart';
import 'package:calori_tracker/screens/home.dart';
import 'package:calori_tracker/screens/profile.dart';
import 'package:calori_tracker/service/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/news_screen.dart';

class SystemProvider with ChangeNotifier {
  int pageIndex = 2;
  User user = User(email: "", name: "", age: 0, weight: 0, height: 0);
  TextEditingController usernameController =
      TextEditingController(text: "admin@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "123567890");
  TextEditingController firstLastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  Services service = Services();

  List<Widget> pages = [
    const NewsScreen(),
    const HomePage(),
    const SliverProfilePage(),
  ];

  void route(int value) {
    pageIndex = value;
    notifyListeners();
  }

  Future<String> getID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('uid') ?? "";
    notifyListeners();
    return data;
  }

  void sessionChange(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', id);
    pageIndex = 2;
    route(0);
    notifyListeners();
  }

  void sessionExed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('uid');
    notifyListeners();
  }

  void userRegisterPost(String userID) async {
    if (userID != "") {
      user.email = usernameController.text;
      user.name = firstLastNameController.text;
      user.age = int.parse(ageController.text);
      user.height = double.parse(ageController.text);
      user.weight = double.parse(weightController.text);
      service.userRegisterPost(user, userID);
      notifyListeners();
    }
  }

  void getProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userID = prefs.getString('uid') ?? "";
    if (userID != "") {
      user = (await service.getUserProfile(userID))!;
      notifyListeners();
    }
  }
}
