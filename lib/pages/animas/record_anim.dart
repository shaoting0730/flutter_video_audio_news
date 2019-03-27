
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class RotateRecord extends AnimatedWidget {
  RotateRecord({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Container(      
      child: new RotationTransition(
          turns: animation,
          child: new Container(
            child:  CircleAvatar(
              radius: 78,
              backgroundImage: NetworkImage(
                  'https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg'),
            ),
          )),
    );
  }
}