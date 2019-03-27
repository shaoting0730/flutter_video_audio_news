import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // UI适配库
import 'package:audioplayers/audioplayers.dart'; // audio
import '../service/service_method.dart'; // 网络请求
import '../model/audio_list_model.dart'; // 歌曲列表模型
import '../model/audio_paly_model.dart'; // 歌曲信息模型
import 'dart:ui'; //引入ui库，因为ImageFilter Widget在这个里边。

import 'dart:convert';

class AudioPage extends StatefulWidget {
  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  AudioPlayer audioPlayer = new AudioPlayer();
  List songsResults = []; // 歌曲list数据数组
  AudioPlayModel songModel;
  String picPremium =
      'https://ww1.sinaimg.cn/large/0073sXn7ly1fze9706gdzj30ae0kqmyw'; //背景图片
  double _value = 0;
  @override
  void initState() {
    super.initState();
    // play();
    _getVideoData();
  }

  // 获取音频列表数据
  void _getVideoData() async {
    await get('audioList').then((val) {
      var data = json.decode(val.toString());
      AudioListmodel model = AudioListmodel.fromJson(data); // 赋值model
      songsResults.addAll(model.songList);
      // 默认加载第一首
      _play(0);
    });
  }

  // 播放歌曲
  _play(index) async {
    String songId = songsResults[index].songId.toString();
    String formdata = '&songid=' + songId;
    await get('audioInfo', formData: formdata).then((val) {
      var data = json.decode(val.toString());
      songModel = AudioPlayModel.fromJson(data);
      setState(() {
        picPremium = songModel.songinfo.picPremium;
      });
      // audioPlayer.play(songModel.bitrate.fileLink);
    });
  }

  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder(
      bloc: _counterBloc,
      builder: (BuildContext context, Map theme) {
        return Scaffold(
          body: Stack(
            //重叠的Stack Widget，实现重贴
            children: <Widget>[
              // 背景图
              ConstrainedBox(
                  //约束盒子组件，添加额外的限制条件到 child上。
                  constraints: const BoxConstraints.expand(), //限制条件，可扩展的。
                  child: FadeInImage.assetNetwork(
                    placeholder: 'images/pages/LaunchImage.jpeg',
                    image: picPremium,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  )),
              Center(
                child: ClipRect(
                  //裁切长方形
                  child: BackdropFilter(
                    //背景滤镜器
                    filter: ImageFilter.blur(
                        sigmaX: 8.0, sigmaY: 8.0), //图片模糊过滤，横向竖向都设置5.0
                    child: Opacity(
                        //透明控件
                        opacity: 0.6,
                        child: Container(
                          // 容器组件
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: Colors.grey), //盒子装饰器，进行装饰，设置颜色为白色
                        )),
                  ),
                ),
              ),
              _audioWidgets(),
            ],
          ),
        );
      },
    );
  }

  // 主体widgets
  Widget _audioWidgets() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 90,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _nameWidget(),
            _songWidget(),
            _btnsWidget(),
            _progressWidget(),
            _controBtnsWidget()
          ],
        ),
      ),
    );
  }

  // 歌曲名
  Widget _nameWidget() {
    return Container(
      child: Text('歌曲名',textAlign: TextAlign.center),
    );
  }

  // 唱针
  Widget _styliWidget() {
    return Container(
      padding: EdgeInsets.only(top: 10.0,left: 30),
      child: Image.asset('images/pages/styli.png'),
      width: ScreenUtil().setWidth(200),
    );
  }

  // 唱盘
  Widget _diskWidget() {
    return Container(
      child: Stack(
        children: <Widget>[
          // Image.asset('images/pages/film.png'),
          Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white30, width: 6),
                  borderRadius: BorderRadius.circular(190),
                  image: DecorationImage(
                    image: AssetImage('images/pages/film.png'),
                    fit: BoxFit.cover,
                  )),
            ),
          Positioned(
            left: 42,
            top: 40,
            child: CircleAvatar(
              radius: 78,
              backgroundImage: NetworkImage(
                  'https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg'),
            ),
          ),
        ],
      ),
    );
  }

  // 合: 唱盘 + 唱针
  Widget _songWidget() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: 420,
      padding: EdgeInsets.only(top: 30.0),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _diskWidget(),
          Positioned(
            top: -10,
            child: _styliWidget(),
          )
        ],
      ),
    );
  }

  // 按钮
  Widget _btnsWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.access_time),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.battery_unknown),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.cake),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.date_range),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.email),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  // 进度条
  Widget _progressWidget() {
    return Container(
        child: Row(
      children: <Widget>[
        Text('00:00', style: TextStyle(color: Colors.white)),
        Expanded(
          child: Slider(
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
            value: _value,
            onChanged: (newValue) {
              print('onChanged:$newValue');
              setState(() {
                _value = newValue;
              });
            },
            onChangeStart: (startValue) {
              print('onChangeStart:$startValue');
            },
            onChangeEnd: (endValue) {
              print('onChangeEnd:$endValue');
            },
            semanticFormatterCallback: (newValue) {
              return '${newValue.round()} dollars';
            },
          ),
        ),
        Text('00:00', style: TextStyle(color: Colors.white)),
      ],
    ));
  }

// 控制按钮
  Widget _controBtnsWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: (){},
            child: Image.asset('images/pages/single.png',fit: BoxFit.fill,width: 30,),
          ),
           InkWell(
            onTap: (){},
            child: Image.asset('images/pages/previous.png',fit: BoxFit.fill,width: 30),
          ),
           InkWell(
            onTap: (){},
            child: Image.asset('images/pages/play.png'),
          ),
           InkWell(
            onTap: (){},
            child: Image.asset('images/pages/next.png',fit: BoxFit.fill,width: 30),
          ),
           InkWell(
            onTap: (){},
            child: Image.asset('images/pages/list.png',fit: BoxFit.fill,width: 30),
          ),

        ],
      ),
    );
  }
}
