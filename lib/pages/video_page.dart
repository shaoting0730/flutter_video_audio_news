import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';  // 上下拉
import 'package:flutter_easyrefresh/bezier_circle_header.dart';  // 上下拉 头
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';  // 上下拉 尾
import '../pages/widgets/drawer_widget.dart'; // 侧边栏
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; // 瀑布流

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false, // 去除debug旗标
      home: MainVideo(),
    );
  }
}

class MainVideo extends StatefulWidget {
  @override
  _MainVideoState createState() => _MainVideoState();
}

class _MainVideoState extends State<MainVideo> {
  List<String> addStr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  List<String> str = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('视频',
              style: TextStyle(fontFamily: 'customFont', fontSize: 30)),
          centerTitle: true),
      drawer: drawerWidget(context), // 侧边栏
      body: EasyRefresh(
        key: _easyRefreshKey,
        refreshHeader: BezierCircleHeader(
          key: _headerKey,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        refreshFooter: BezierBounceFooter(
          key: _footerKey,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: _waterFall(),
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              str.clear();
              str.addAll(addStr);
            });
          });
        },
        loadMore: () async {
          await new Future.delayed(const Duration(seconds: 1), () {
            if (str.length < 20) {
              setState(() {
                str.addAll(addStr);
              });
            }
          });
        },
       ),
    );
  }

  // 瀑布流
  Widget _waterFall(){
    return StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) => new Container(
              color: Colors.green,
              child: new Center(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text('$index'),
                ),
              )),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
     );
  }
}

