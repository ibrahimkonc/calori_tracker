import 'dart:convert';
import 'package:calori_tracker/model/news_model.dart';
import 'package:http/http.dart' as http;
import '../model/item_model.dart';

const String _baseUrlSearch =
    "https://api.calorieninjas.com/v1/nutrition?query=";
const String _baseUrl =
    "https://calori-tracker-c2f3e-default-rtdb.europe-west1.firebasedatabase.app/";

class Services {
  Uri getUrlSearch(String search) => Uri.parse("$_baseUrlSearch$search");
  Uri getUrl(String endpoint) => Uri.parse("$_baseUrl$endpoint.json");

  //var url = Uri.https(_baseUrl, "/users", {"auth": idtoken});
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

  Future<String> addFoodPost(Items data, String userID, int categoryID) async {
    http.Response response = await http.post(
        getUrl("foods/$userID/$categoryID"),
        body: data.toJson(),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);

      var processID = data["name"];
      return processID;
    } else {
      return "";
    }
  }

  Future<List<Items>?> getFoodById(String userID, int category) async {
    List<Items> list = [];
    http.Response response = await http.get(getUrl("foods/$userID/$category"));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      if (data != null) {
        for (var key in data.keys) {
          Items food = Items.fromMap(data[key]);
          food.foodID = key;
          list.add(food);
        }
        return list;
      }
      return null;
    } else {
      return null;
    }
  }

  Future<bool> deleteFood(String userID, int category, String foodID) async {
    http.Response response =
        await http.delete(getUrl("foods/$userID/$category/$foodID"));
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  Future<List<NewsModel>> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=f3e5b87c8f484116b9543a3fd2a81cdb";

    http.Response response = await http.get(Uri.parse(url));
    var a = jsonDecode(response.body);
    List<NewsModel> list = [];
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = json.decode(response.body);
      var data1 = data["articles"];
      if (data1 != null) {
        // for (var i = 0; i < data1.length; i++) {
        //   Articles user = Articles.fromMap(data1[i]);
        //   list.add(user);
        // }
        for (var i in data1) {
          NewsModel user = NewsModel.fromMap(i);
          list.add(user);
        }
      }
    }
    print(list.length);
    return list;
  }

  Future<List<Items>?> getFoodAll(String userID) async {
    List<Items> list = [];

    for (int i = 1; i <= 4; i++) {
      http.Response response = await http.get(getUrl("foods/$userID/$i"));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var data = json.decode(response.body);
        if (data != null) {
          for (var key in data.keys) {
            Items food = Items.fromMap(data[key]);
            food.foodID = key;
            list.add(food);
          }
        }
      }
    }
    return list;
  }
}
