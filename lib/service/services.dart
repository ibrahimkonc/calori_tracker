import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/item_model.dart';

const String _baseUrlSearch =
    "https://api.calorieninjas.com/v1/nutrition?query=";
const String _baseUrl =
    "https://calori-tracker-c2f3e-default-rtdb.europe-west1.firebasedatabase.app/";

class Services {
  Uri getUrlSearch(String search) => Uri.parse("$_baseUrlSearch$search");
  Uri getUrl(String endpoint) => Uri.parse("$_baseUrl/$endpoint.json");

  Future<List<Items>> getSearch(String search) async {
    List<Items> list = [];
    http.Response response = await http.get(getUrlSearch(search),
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

  Future<String> addFoodPost(Items data) async {
    http.Response response = await http.post(getUrl("foods"),
        body: data.toJson(), headers: {"Content-Type": "application/json"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      var processID = data["name"];
      return processID;
    } else {
      return "";
    }
  }
}
