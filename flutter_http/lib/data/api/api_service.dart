import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/article.dart';

class ApiSerivce {
  static final String _baseUrl = 'https://newsapi.org/v2/';
  static final String _apiKey = 'a35880b0ec54413aa1a6f8fd709cf3d4';
  static final String _category = 'business';
  static final String _country = 'id';

  Future<ArticleResult> topHeadlines() async {
    final response = await http.get(Uri.parse(_baseUrl +
      "top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if(response.statusCode == 200){
      return ArticleResult.fromJson(json.decode(response.body));
    } else{
      throw Exception("Failed to load top headlines");
    }
  }
}