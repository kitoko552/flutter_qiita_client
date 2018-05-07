import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import '../models/Post.dart';

class PostListItem extends StatelessWidget {
  final Post _post;

  PostListItem(Post post)
    : _post = post;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
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
        _launchURL(_post.urlString, context);
      },
    );
  }

  void _launchURL(String url, BuildContext context) async {
    try {
      await launch(
        url,
        option: new CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
