import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/Post.dart';

class PostListItem extends StatelessWidget {
  final Post _post;

  PostListItem(Post post)
    : _post = post;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 80.0,
      child: new ListTile(
        leading: new Container(
          child: new ClipOval(
            child: new CachedNetworkImage(
              imageUrl: _post.user.profileImageUrl,
              fit: BoxFit.cover,
            )
          )
        ),
        title: new Text(_post.title),
        onTap: () {
          _launchURL(_post.urlString);
        },
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
