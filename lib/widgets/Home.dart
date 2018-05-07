import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/Post.dart';
import 'PostListItem.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Qiita Client'),
      ),
      body: new FutureBuilder<List<Post>>(
        future: _fetch('https://qiita.com/api/v2/items?page=1&per_page=20&query=flutter'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return PostListItem(snapshot.data[index]);
              },
            );
          } else if (snapshot.hasError) {
            return new Center(
              child: new Text("${snapshot.error}"),
            );
          } else {
            return new Center(
              child: new CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Post>> _fetch(String url) async {
    final http.Response response = await http.get(url);
    final List<dynamic> responseBody = await json.decode(response.body);
    return responseBody.map((val) => new Post.fromJson(val)).toList();
  }
}


