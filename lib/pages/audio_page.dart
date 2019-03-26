import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // UI适配库
import 'package:audioplayers/audioplayers.dart'; // audio
import '../service/service_method.dart'; // 网络请求
import '../model/audio_list_model.dart'; // 歌曲列表模型
import '../model/audio_paly_model.dart'; // 歌曲信息模型

import 'dart:convert';

class AudioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueAccent),
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
    return BlocBuilder(
      bloc: _counterBloc,
      builder: (BuildContext context, Map theme) {
        return Scaffold(
          // 导航条渐变色
          appBar: PreferredSize(
            child: Container(
              child: AppBar(
                title: Text(
                  '音频',
                  style: TextStyle(
                      fontFamily: '${theme['fontFamily']}',
                      fontSize: ScreenUtil().setSp(60)),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme['color'],
                    Colors.white,
                  ],
                ),
              ),
            ),
            preferredSize: Size(MediaQuery.of(context).size.width, 45),
          ),
          body: AudioContainer(),
        );
      },
    );
  }
}

// 音频
class AudioContainer extends StatefulWidget {
  final Widget child;

  AudioContainer({Key key, this.child}) : super(key: key);

  _AudioContainerState createState() => _AudioContainerState();
}

class _AudioContainerState extends State<AudioContainer> {
  AudioPlayer audioPlayer = new AudioPlayer();
  List songsResults = []; // 歌曲list数据数组
  AudioPlayModel songModel;

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
      AudioListmodel model = AudioListmodel.fromJson(data);  // 赋值model
      songsResults.addAll(model.songList);
      // 默认加载第一首
      _play(0);
    });
  }

  // 播放歌曲
  _play(index) async {
    String songId = songsResults[index].songId.toString();
    String formdata = '&songid=' + songId;
     await get('audioInfo',formData: formdata).then((val) {
      var data = json.decode(val.toString());
      songModel = AudioPlayModel.fromJson(data);
      audioPlayer.play(songModel.bitrate.fileLink);
    
    });

    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }

  
  //  背景widget
  


}
