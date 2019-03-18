import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum CounterEvent { changeTheme }

class CounterBloc extends Bloc<CounterEvent, Map> {
  @override
  Map get initialState => {'color': Colors.pink, 'fontFamily': 'customFont'};

  @override
  Stream<Map> mapEventToState(Map initialState, CounterEvent event) async* {
    switch (event) {
      case CounterEvent.changeTheme:
        print('++++++++++++++____________++++++++');

        if (initialState['fontFamily'] == 'customFont') {
          yield initialState = {'color': Colors.blueAccent, 'fontFamily': ''};
        } else {
          yield initialState = {
            'color': Colors.pink,
            'fontFamily': 'customFont'
          };
        }

        break;
    }
  }
}
