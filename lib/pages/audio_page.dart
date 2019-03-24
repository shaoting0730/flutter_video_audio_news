import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // UI适配库
import 'package:audioplayers/audioplayers.dart';


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
                  title: Text('音频',
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

    play() async {
    int result = await audioPlayer.play('http://zhangmenshiting.qianqian.com/data2/music/3519cdb70c14a95076e8c006c7226963/599516462/599516462.mp3?xcode=b4d663fa23a8fa59b123be2e4a685e68');
    if (result == 1) {
      // success
    }
  }

  @override
  void initState() {
    super.initState();
    play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: widget.child,
    );
  }
}
