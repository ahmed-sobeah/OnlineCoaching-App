import 'dart:convert';
import 'package:ali_nasser_online_coaching_app/database_manger/api/model/Food_model/Food_response.dart';
import 'package:http/http.dart' as http;

class ApiManger{
  static const String baseUrl = 'api.edamam.com';
  static const String apiKey='e6d4262f86b270accf049bfc1f97385a';
  static const String appId='f4e03bc6';
  static Future<FoodResponse> getFood() async{
    Uri url = Uri.https(baseUrl,'/api/food-database/v2/parser',{
      'app_key':apiKey,
      'app_id':appId
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    FoodResponse foodResponse = FoodResponse.fromJson(json);

    return foodResponse;
  }
}