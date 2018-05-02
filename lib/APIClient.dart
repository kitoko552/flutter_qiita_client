import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Post.dart';

class APIClient {
  static Future<List<Post>> fetch(String url) async {
    final http.Response response = await http.get(url);
    final List<dynamic> responseBody = await json.decode(response.body);
    return responseBody.map((val) => new Post.fromJson(val)).toList();
  }

  // TODO: abstract
  // static Future<T> fetch<T extends JSONDecodable>(String url) async {
  //   final response = await http.get(url);
  //   final responseBody = json.decode(response.body);
  //   return new T(responseBody);
  // }
}

// TODO: abstract
// abstract class JSONDecodable {
//   JSONDecodable(Map<String, dynamic> json);
// }