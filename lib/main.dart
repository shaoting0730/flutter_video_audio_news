import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc/counter_bloc.dart';
import './tabbar.dart';

void main() {
  // runApp(MyApp());
  runApp(BlocProvider<CounterBloc>(
      bloc: CounterBloc(),
      child: BlocProvider(child: MyApp(), bloc: CounterBloc()),
    ));
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
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder(
       bloc:_counterBloc,
       builder: (BuildContext context,Map theme){
           return MaterialApp(
      title: 'Flutter 实战练习',
      theme: ThemeData(primaryColor: theme['color']),
      debugShowCheckedModeBanner: false, // 去除debug旗标
      home: Tabbar(),
    );
       },
    );
  }
}
