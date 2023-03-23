import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../model/item_model.dart';

const String realTimeDbBaseUrl =
    "https://calori-tracker-c2f3e-default-rtdb.europe-west1.firebasedatabase.app/";

const String _baseUrl = "https://api.calorieninjas.com/v1/nutrition?query=";

class Services {
  Uri getUrl(String search) => Uri.parse("$_baseUrl$search");

  Future<List<Items>> getSearch(String search) async {
    List<Items> list = [];
    http.Response response = await http.get(getUrl(search),
        headers: {"X-Api-Key": "2mF1bpVMokPCnhzOwEnPgQ==Oa5RTTQJPVM6iEzT"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      var data1 = data["items"];
      if (data1 != null) {
        for (var i = 0; i < data1.length; i++) {
          Items user = Items.fromMap(data1[i]);
          list.add(user);
        }
      }
    }
    return list;
  }
}
