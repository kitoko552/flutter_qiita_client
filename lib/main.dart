import 'package:flutter/material.dart';

import 'Post.dart';
import 'APIClient.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Qiita Client',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Qiita Client'),
      ),
      body: new Center(
        child: new FutureBuilder<List<Post>>(
          future: APIClient.fetch('https://qiita.com/api/v2/items?page=1&per_page=1&query=flutter'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print('hasData');
              return new Text(snapshot.data.first.user.id);
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            } else {
              return new CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}