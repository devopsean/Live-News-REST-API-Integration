import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api_integration_youtube/constants/strings.dart';
import 'package:rest_api_integration_youtube/models/newsinfo.dart';

class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(Uri.parse(Strings.news_url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
         newsModel = NewsModel.fromJson(jsonMap);

      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
