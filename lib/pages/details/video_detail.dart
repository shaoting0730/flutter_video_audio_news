import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart'; // 播放
import 'package:video_player/video_player.dart'; // 播放
import 'package:flutter_screenutil/flutter_screenutil.dart';  // UI适配库
import './comment_detail.dart'; // 评论
import './video_info.dart'; // 简介


class VideoDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('视频详情'),
      ),
      body: VideoPage(),
    );
  }
}


class VideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VideoPageState();
}

class TabTitle {
  String title;
  Widget widget;

  TabTitle(this.title, this.widget);
}

class VideoPageState extends State<VideoPage> with SingleTickerProviderStateMixin {
  TabController mTabController;
  PageController mPageController = PageController(initialPage: 0);
  List<TabTitle> tabList;
  var currentPage = 0;
  var isPageCanChanged = true;

  @override
  void initState() {
    super.initState();
    initTabData();
    mTabController = TabController(
      length: tabList.length,
      vsync: this,
    );
    mTabController.addListener(() {
      //TabBar的监听
      if (mTabController.indexIsChanging) {
        //判断TabBar是否切换
        print(mTabController.index);
        onPageChange(mTabController.index, p: mPageController);
      }
    });
  }

  initTabData() {
    tabList = [
      new TabTitle('简介', VideoInfo()),
      new TabTitle('评论', CommentDetail()),
    ];
  }

  onPageChange(int index, {PageController p, TabController t}) async {
    if (p != null) {
      //判断是哪一个切换
      isPageCanChanged = false;
      await mPageController.animateToPage(index,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease); //等待pageview切换完毕,再释放pageivew监听
      isPageCanChanged = true;
    } else {
      mTabController.animateTo(index); //切换Tabbar
    }
  }

  @override
  void dispose() {
    super.dispose();
    mTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        VideoContainer(),
        Container(
          color: new Color(0xfff4f5f6),
          height: 38.0,
          width: ScreenUtil().setWidth(750),
          child: TabBar(
            // isScrollable: true,
            controller: mTabController,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.red,
            unselectedLabelColor: Color(0xff666666),
            labelStyle: TextStyle(fontSize: 16.0),
            tabs: tabList.map((item) {
              return Tab(
                text: item.title,
              ); 
            }).toList(),
          ),
        ),
        Expanded(
          child: PageView.builder(
            itemCount: tabList.length,
            onPageChanged: (index) {
              if (isPageCanChanged) {
                //由于pageview切换是会回调这个方法,又会触发切换tabbar的操作,所以定义一个flag,控制pageview的回调
                onPageChange(index);
              }
            },
            controller: mPageController,
            itemBuilder: (BuildContext context, int index) {
              return tabList[index].widget;
            },
          ),
        )
      ],
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
