import 'package:flutter/material.dart';

import 'widgets/Home.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Qiita Client',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Home(),
    );
  }
}