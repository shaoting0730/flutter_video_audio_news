import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';

class AudioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      debugShowCheckedModeBanner: false, // 去除debug旗标
      home: MainAudio(),
    );
  }
}

class MainAudio extends StatefulWidget {

  @override
  _MainAudioState createState() => _MainAudioState();
}

class _MainAudioState extends State<MainAudio> {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          child: AppBar(
            title: Text('音频'),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blueAccent,
                Colors.white,
              ],
            ),
          ),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 45),
      ),
      body: BlocBuilder<CounterEvent, Map>(
        bloc: _counterBloc,
        builder: (BuildContext context, Map theme){
          return Center(
             child: Text('$theme'), 
          );
        },
      ),
    );
  }
}