import 'package:flutter/material.dart';

import 'tab_navigator.dart';

/***
 * Flutter仿照微信读书页面
 */
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter仿照微信读书页面',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabNavigator(),
    );
  }
}
