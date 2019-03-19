import 'package:flutter/material.dart';

class VideoInfo extends StatefulWidget {
  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
   Map infoData = {
       "personInfo":{
         "portrait":"https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg",
         "name":"习大大",
         "fensi":110,
         "attention":0,
       },
       "videoInfo":{
         "playCount":138,
         "commentCount":85,
         "date":"02-21",
         "order":"AV45475733",
         "comment":"习大大就程序员工作作出重要指导",
         "subComment":"哔哩哔哩~",
         "starCount":72,
         "unlikeCount":12,
         "gold":7,
         "collect":22,
         "transmit":89,
       },
       "videoTag":[
         "指示","娱乐","程序员","习大大","视频会议","下班","改bug"
       ],
       "recommendVideo":[
           {
             "title":"西瓜不能多吃",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fze98q9ydbj30ko10wmyn",
             "up":"西瓜小子",
             "playCount":192,
             "commentCount":24
          },
           {
             "title":"公务员考试秘笈",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fyteamvvacj30f00qowqf",
             "up":"人民公仆",
             "playCount":112,
             "commentCount":134
          },
           {
             "title":"单车上写代码",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fyteb9s5hfg307i0dctpi",
             "up":"西红柿首富",
             "playCount":129,
             "commentCount":249
          },
           {
             "title":"2019年是个好年",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fytebchnkvg305k09wgr3",
             "up":"走马看花",
             "playCount":142,
             "commentCount":934
          },
           {
             "title":"1999年暴露了",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fytebllqelg30ak0irtbg",
             "up":"哒哒哒哒哒",
             "playCount":112,
             "commentCount":98
          },
           {
             "title":"程序员猝死几率逐年增大",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fyteaon7g6j30f00qo46p",
             "up":"大大强",
             "playCount":102,
             "commentCount":134
          },
           {
             "title":"程序员干不到15岁,因为死于34岁",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fze98xgwk8j30u01hggqe",
             "up":"大强",
             "playCount":122,
             "commentCount":204
          },
           {
             "title":"苍老师过马路",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fytebahwa1j30aq0ju41i",
             "up":"小强",
             "playCount":19,
             "commentCount":20
          },
           {
             "title":"今天狮子跑了",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fze98xy35jj30u00u0gnp",
             "up":"刘强",
             "playCount":14,
             "commentCount":24
          },
           {
             "title":"造数据好无聊",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fytebl6cj1j30qo1hcq4p",
             "up":"刘东强",
             "playCount":10,
             "commentCount":230
          },
           {
             "title":"今天鞋垫脏了",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fytebbuiw1j30u01o0k29",
             "up":"刘强东",
             "playCount":1,
             "commentCount":4
          },
           {
             "title":"嘻嘻哗啦",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fze9706gdzj30ae0kqmyw",
             "up":"马云",
             "playCount":52,
             "commentCount":314
          },
           {
             "title":"世界第三次大战",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fze970ocgxj30ae0ks0tc",
             "up":"化腾",
             "playCount":122,
             "commentCount":534
          },
           {
             "title":"走在乡间的小路上",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fze973gq93g309c0godph",
             "up":"马腾",
             "playCount":62,
             "commentCount":434
          },
           {
             "title":"喜马拉雅安装电梯",
             "pic":"https://ww1.sinaimg.cn/large/0073sXn7ly1fze97fxcgxj305e09mq5n",
             "up":"马化",
             "playCount":121,
             "commentCount":234
          }
       ]
   };


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[personInfo()],
        ),
      ),
    );
  }

  // 个人信息
  Widget personInfo() {
    return Row(
      children: <Widget>[
        Text('111'),
        Column(
          children: <Widget>[
            Text('222'),
            Text('333'),
          ],
        ),
        Text('4444')
      ],
    );
  }
}
