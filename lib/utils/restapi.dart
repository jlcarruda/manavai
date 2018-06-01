import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'card_post.dart';

class RestApi {

  static Future<List> getCardList() async {
    http.Response response = await http.get(
      Uri.encodeFull("https://api.scryfall.com/cards?page=1"),
      headers: {
//        "key": "n:ausdhasud",
        "Accept": "application/json"
      }
    );
    Map<String, dynamic> jsonObj = json.decode(response.body);
    return _generatePostList(jsonObj['data']);
  }

  static List<CardPost> _generatePostList(List data) {
    print(data.length);
    return new List.generate(data.length, (int index) {
      return new CardPost.fromJson(data[index]);
    });
  }
}