import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

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
          imageUrl: _post.user.profileImageUrl,
          fit: BoxFit.cover,
        )
      ),
      title: Text(_post.title),
      onTap: () {
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) {
              return new WebView(
                url: _post.urlString,
                title: _post.title
              );
            }
          )
        );
      },
    );
  }
}

class WebView extends StatelessWidget {
  final String _url;
  final String _title;

  WebView({String url, String title})
    : _url = url, _title = title;

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: _url,
      appBar: new AppBar(
        title: new Text(_title),
      ),
    );
  }
}