import 'package:flutter/material.dart';

import '../model/news_model.dart';
import '../service/services.dart';

class NewsProvider extends ChangeNotifier {
  Services services = Services();
  List<NewsModel> newsList = [];

  void getNews() async {
    newsList = await services.getNews();
    notifyListeners();
  }
   

}