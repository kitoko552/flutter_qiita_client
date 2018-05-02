import 'package:flutter/material.dart';

import '../APIClient.dart';
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
        future: APIClient.fetch('https://qiita.com/api/v2/items?page=1&per_page=20&query=flutter'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new ListView(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              children: snapshot.data.map((post) => new PostListItem(post)).toList(),
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
}


