import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // UI适配库

class CommentDetail extends StatefulWidget {
  @override
  _CommentDetailState createState() => _CommentDetailState();
}

class _CommentDetailState extends State<CommentDetail> {

  List commentList = [
      {
        "portrait":
          "https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg",
        "username":"大卡车1",
        "grade":"lv5",
        "comment":"我是一楼",
        "date":"4小时前",  
      },
      {
          "portrait":
          "https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg",
        "username":"大卡车2",
        "grade":"lv1",
        "comment":"掐楼上小jj",
        "date":"2小时前",  
      },
      {
          "portrait":
          "https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg",
        "username":"这是一个逗比",
        "grade":"lv2",
        "comment":"今天天气汇丰火腿肠",
        "date":"半小时前",  
      },
      {
          "portrait":
          "https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg",
        "username":"星期8",
        "grade":"lv9",
        "comment":"听说评论可以获得好运.",
        "date":"4小时前",  
      },
      {
          "portrait":
          "https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg",
        "username":"😆嘻嘻😆",
        "grade":"lv5",
        "comment":"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
        "date":"4小时前",  
      },
      {
          "portrait":
          "https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg",
        "username":"大卡车",
        "grade":"lv5",
        "comment":"不想上班",
        "date":"1天前",  
      },
      {
          "portrait":
          "https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg",
        "username":"小客车",
        "grade":"lv2",
        "comment":"好累",
        "date":"4小时前",  
      },
      {
          "portrait":
          "https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg",
        "username":"大卡车转丫丫",
        "grade":"lv5",
        "comment":"这个狗尾巴有点短",
        "date":"3小时前",  
      },
      {
          "portrait":
          "https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg",
        "username":"奥玛",
        "grade":"lv9",
        "comment":"默默打个卡",
        "date":"4天前",  
      },
      
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
             child: Text('评论'),
    );
  }
}