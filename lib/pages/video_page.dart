import 'package:flutter/material.dart';
import '../pages/widgets/drawer_widget.dart'; // 侧边栏
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; // 瀑布流
import 'package:flutter_easyrefresh/easy_refresh.dart'; //  上下拉

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
      body: EasyRefresh(   // 上下拉刷新
        refreshFooter: ClassicsFooter(
          key: _footerKey,
          bgColor: Colors.white,
          textColor: Colors.pink,
          moreInfoColor: Colors.pink,
          showMore: true,
          noMoreText: '',
          moreInfo: '加载中...',
          loadReadyText: '上拉加载😝',
        ),
        child: _waterFall(),
        loadMore: () async {},
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


