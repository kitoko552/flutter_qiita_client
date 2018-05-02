import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

class PostListItem extends StatelessWidget {
  final Post _post;

  PostListItem(Post post)
    : _post = post;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: ClipOval(
        child: CachedNetworkImage(
          // placeholder: new CircularProgressIndicator(),
          imageUrl: _post.user.profileImageUrl,
          fit: BoxFit.cover,
        )
        // child: Image.network(
        //   _post.user.profileImageUrl,
        //   fit: BoxFit.cover,
        //   // width: 90.0,
        //   // height: 90.0,
        //   ),
      ),
      title: Text(_post.title),

    );
  }
}