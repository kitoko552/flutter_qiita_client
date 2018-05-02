import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/Post.dart';
import 'WebView.dart';

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
