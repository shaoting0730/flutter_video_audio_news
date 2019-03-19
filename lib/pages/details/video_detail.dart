import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart'; // 播放
import 'package:video_player/video_player.dart'; // 播放
import 'package:flutter_screenutil/flutter_screenutil.dart';  // UI适配库
import './comment_detail.dart'; // 评论
import './video_info.dart'; // 简介

class VideoDetails extends StatelessWidget {
  final String date;
  final String picUrl;
  VideoDetails({Key key, @required this.picUrl, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('视频详情'),
      ),
      body: Column(
        children: <Widget>[
          VideoContainer(),
          BottomContainer(picUrl: picUrl,date: date,),
        ],
      ),
    );
  }
}

// 底部视图
class BottomContainer extends StatefulWidget {
  final String date;
  final String picUrl;
  BottomContainer({Key key, @required this.picUrl, this.date})
      : super(key: key);
  @override
  _BottomContainerState createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _index = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Column(
          children: <Widget>[
            TabBar(
              controller: _controller,
              unselectedLabelColor:Colors.black,
              labelColor:Colors.red,
              indicatorSize: TabBarIndicatorSize.label,
               labelStyle: new TextStyle(fontSize: ScreenUtil().setSp(32)),
               unselectedLabelStyle: new TextStyle(fontSize: ScreenUtil().setSp(28)),
              onTap: (index){
               setState(() {
            _index = index;
             });
              },
              tabs: <Widget>[
                Text('简介'),
                Text('评论')
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: SizedBox(
                 child: IndexedStack(
                   children: <Widget>[
                     VideoInfo(),
                     CommentDetail()
                   ],
                   index: _index,
                 ),
              ),
            ),
          ],
        ),
    );
  }
}

// 视频播放
class VideoContainer extends StatefulWidget {
  @override
  _VideoContainerState createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;
  //

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.asset('video.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: false,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }
}
