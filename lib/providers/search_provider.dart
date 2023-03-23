import 'package:calori_tracker/model/item_model.dart';
import 'package:flutter/material.dart';

import '../service/services.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  List<Items> searchList = [];
  Services service = Services();

  void getSearch(String query) async {
    searchList = await service.getSearch(query);
    notifyListeners();
  }

  // List<SearchModel> _searchList = [];
  // List<SearchModel> get searchList => _searchList;

  // void setSearchList(List<SearchModel> searchList) {
  //   _searchList = searchList;
  //   notifyListeners();
  // }
}
