import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Post.dart';

class APIClient {
  static Future<Post> fetch(String url) async {
    final response = await http.get(url);
    final responseBody = json.decode(response.body);
    return new Post.fromJson(responseBody);
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