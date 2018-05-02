import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

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