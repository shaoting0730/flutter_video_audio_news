import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'dart:math';

enum CounterEvent { changeTheme }

class CounterBloc extends Bloc<CounterEvent, Map> {
  @override
  Map get initialState => {'color': Colors.pink, 'fontFamily': 'customFont'};

  @override
  Stream<Map> mapEventToState(Map initialState, CounterEvent event) async* {
    switch (event) {
      case CounterEvent.changeTheme:
        var r = Random().nextInt(255) ;
        var g = Random().nextInt(255) ;
        var b = Random().nextInt(255) ;
    
        var color =Color.fromRGBO(r, g, b, 1.0);
        if (initialState['fontFamily'] == 'customFont') {
          yield initialState = {'color': color, 'fontFamily': ''};
        } else {
          yield initialState = {
            'color': color,
            'fontFamily': 'customFont'
          };
        }

        break;
    }
  }
}
