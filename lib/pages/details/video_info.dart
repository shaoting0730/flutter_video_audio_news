import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // UI适配库


class VideoInfo extends StatefulWidget {
  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  Map infoData = {
	"personInfo": {
		"portrait": "https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg",
		"name": "习大大",
		"fensi": 110,
		"attention": 0
	},
	"videoInfo": {
		"playCount": 138,
		"commentCount": 85,
		"date": "02-21",
		"order": "AV45475733",
		"title": "习大大就程序员工作作出重要指导",
		"subTitle": "哔哩哔哩~",
		"starType": 0,
		"goldType": 0,
		"collectType": 0,
		"shareType": 0,
		"starCount": 72,
		"unlikeCount": 12,
		"gold": 7,
		"collect": 22,
		"transmit": 89
	},
	"videoTag": ["指示", "娱乐", "程序员", "习大大", "视频会议", "下班", "改bug"],
	"moreVideo": [{
			"title": "西瓜不能多吃",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fze98q9ydbj30ko10wmyn",
			"up": "西瓜小子",
			"playCount": 192,
			"commentCount": 24
		},
		{
			"title": "公务员考试秘笈",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fyteamvvacj30f00qowqf",
			"up": "人民公仆",
			"playCount": 112,
			"commentCount": 134
		},
		{
			"title": "单车上写代码",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fyteb9s5hfg307i0dctpi",
			"up": "西红柿首富",
			"playCount": 129,
			"commentCount": 249
		},
		{
			"title": "2019年是个好年",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fytebchnkvg305k09wgr3",
			"up": "走马看花",
			"playCount": 142,
			"commentCount": 934
		},
		{
			"title": "1999年暴露了",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fytebllqelg30ak0irtbg",
			"up": "哒哒哒哒哒",
			"playCount": 112,
			"commentCount": 98
		},
		{
			"title": "程序员猝死几率逐年增大",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fyteaon7g6j30f00qo46p",
			"up": "大大强",
			"playCount": 102,
			"commentCount": 134
		},
		{
			"title": "程序员干不到15岁,因为死于34岁",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fze98xgwk8j30u01hggqe",
			"up": "大强",
			"playCount": 122,
			"commentCount": 204
		},
		{
			"title": "苍老师过马路",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fytebahwa1j30aq0ju41i",
			"up": "小强",
			"playCount": 19,
			"commentCount": 20
		},
		{
			"title": "今天狮子跑了",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fze98xy35jj30u00u0gnp",
			"up": "刘强",
			"playCount": 14,
			"commentCount": 24
		},
		{
			"title": "造数据好无聊",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fytebl6cj1j30qo1hcq4p",
			"up": "刘东强",
			"playCount": 10,
			"commentCount": 230
		},
		{
			"title": "今天鞋垫脏了",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fytebbuiw1j30u01o0k29",
			"up": "刘强东",
			"playCount": 1,
			"commentCount": 4
		},
		{
			"title": "嘻嘻哗啦",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fze9706gdzj30ae0kqmyw",
			"up": "马云",
			"playCount": 52,
			"commentCount": 314
		},
		{
			"title": "世界第三次大战",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fze970ocgxj30ae0ks0tc",
			"up": "化腾",
			"playCount": 122,
			"commentCount": 534
		},
		{
			"title": "走在乡间的小路上",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fze973gq93g309c0godph",
			"up": "马腾",
			"playCount": 62,
			"commentCount": 434
		},
		{
			"title": "喜马拉雅安装电梯",
			"pic": "https://ww1.sinaimg.cn/large/0073sXn7ly1fze97fxcgxj305e09mq5n",
			"up": "马化",
			"playCount": 121,
			"commentCount": 234
		}
	]
};

  List<Widget> listTag;

  @override
  Widget build(BuildContext context) {
            // print('222222222');
        // print(model.personInfo.name);

    return Container(
      color: Color.fromRGBO(240, 240, 240, 1.0),
      padding: EdgeInsets.all(7.0),
      child: ListView(
        children: <Widget>[
          personInfo(),
          videoInfo(),
          btnsWidget(),
          videoTag(),
          moreVideo(),
        ],
      ),
    );
  }

  // 个人信息
  Widget personInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            // 圆角边框头像
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 1),
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: NetworkImage(
                      infoData['personInfo']['portrait'],
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                children: <Widget>[
                  Text('${infoData['personInfo']['name']}',
                      style: TextStyle(fontSize: ScreenUtil().setSp(26))),
                  Text('${infoData['personInfo']['fensi']}' + '粉丝',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(18),
                          color: Colors.black38)),
                ],
              ),
            )
          ],
        ),
        FlatButton(
          child: infoData['personInfo']['attention'] == 0
              ? Text(
                  '+ 关注',
                  style: TextStyle(color: Colors.white),
                )
              : Text(
                  '+ 取消关注',
                  style: TextStyle(color: Colors.white),
                ),
          color: Colors.pink[300],
          highlightColor: Colors.red[700],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.00)),
          onPressed: () {
            print('自定义样式外观');
          },
        )
      ],
    );
  }

  // 视频详情
  Widget videoInfo() {
    return Container(
      child: ExpansionTile(
        title: Text('${infoData['videoInfo']['title']}'),
        children: <Widget>[
          Row(
            children: <Widget>[Text('🚫未经作者同意授权禁止转载')],
          )
        ],
        initiallyExpanded: false,
      ),
    );
  }

  // 按钮Widget
  Widget btnsWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Column(
              children: <Widget>[
                infoData['videoInfo']['starType'] == 0
                    ? Image.asset('images/pages/star_black.png')
                    : Image.asset('images/pages/star_red.png'),
                Text('14')
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: <Widget>[
                infoData['videoInfo']['starType'] == 0
                    ? Image.asset('images/pages/unStar_black.png')
                    : Image.asset('images/pages/unStar_red.png'),
                Text('14')
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: <Widget>[
                infoData['videoInfo']['goldType'] == 0
                    ? Image.asset('images/pages/gold_black.png')
                    : Image.asset('images/pages/gold_red.png'),
                Text('14')
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: <Widget>[
                infoData['videoInfo']['collectType'] == 0
                    ? Image.asset('images/pages/collet_black.png')
                    : Image.asset('images/pages/collet_red.png'),
                Text('14')
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: <Widget>[
                infoData['videoInfo']['shareType'] == 0
                    ? Image.asset('images/pages/share_black.png')
                    : Image.asset('images/pages/share_red.png'),
                Text('14')
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 视频标签
  Widget videoTag() {
    return Container(
      child: Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 4.0, // 纵轴（垂直）方向间距
          children: tag()),
    );
  }

  List<Widget> tag() {
    List<Widget> list = [];
    infoData['videoTag'].forEach((val) {
      list.add(
        ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
            color: Colors.black26,
            child: Text(val),
          ),
        ),
      );
    });
    return list;
  }

  // 下方列表
  Widget moreVideo() {
    if (infoData['moreVideo'].length != 0) {
      List<Widget> list = [];
      infoData['moreVideo'].forEach((e) {
        list.add(
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Colors.black26))),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(e['pic'],
                        width: ScreenUtil().setWidth(250),
                        height: ScreenUtil().setHeight(100),
                        fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          e['title'],
                          maxLines: 1,
                        ),
                        Text('📱' + e['up'], maxLines: 1),
                        Container(
                          width: ScreenUtil().setWidth(750 - 320),
                          child: Stack(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Image.asset('images/pages/play.png'),
                                      Text(e['playCount'].toString()),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                            'images/pages/commen_black.png'),
                                        Text(e['commentCount'].toString())
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0.0,
                                right: 30.0,
                                child: Image.asset('images/pages/more.png'),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
      return Column(children: list);
    } else {
      return Text('没数据');
    }
  }
}
