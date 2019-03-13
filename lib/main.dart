import 'package:flutter/material.dart';
import 'tabbar.dart';
import 'dart:io';
import 'package:flutter/services.dart';


void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 实战练习',
      debugShowCheckedModeBanner: false, // 去除debug旗标
      theme: ThemeData(
        primaryColor: Colors.pink
      ),
      home: Tabbar(),
    );
  }
}
