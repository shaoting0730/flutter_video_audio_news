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
  String picPremium = ''; //背景图片

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
                        sigmaX: 5.0, sigmaY: 5.0), //图片模糊过滤，横向竖向都设置5.0
                    child: Opacity(
                      //透明控件
                      opacity: 0.5,
                      child: Container(
                        // 容器组件
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200), //盒子装饰器，进行装饰，设置颜色为灰色
                        child: audioWidgets()
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // 主体widgets
  Widget audioWidgets(){
    return Container(
      child: SafeArea(
        child: Text('333'),
      ),
    );
  }
}
