import 'package:flutter/material.dart';
import 'dart:convert';
import '../model/video_context_model.dart'; // 模型
import '../service/service_method.dart'; // 网络请求
import 'package:flutter_easyrefresh/easy_refresh.dart'; // 上下拉
import 'package:flutter_easyrefresh/bezier_circle_header.dart'; // 上下拉 头
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart'; // 上下拉 尾
import '../pages/widgets/drawer_widget.dart'; // 侧边栏
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; // 瀑布流
import './details/video_detail.dart';   // 视频详情
import 'package:flutter_screenutil/flutter_screenutil.dart'; // UI适配库
import 'package:flutter_bloc/flutter_bloc.dart';   // bloc
import '../bloc/counter_bloc.dart';  // bloc

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder(
      bloc: _counterBloc,
      builder: (BuildContext context, Map theme) {
        return Scaffold(
          appBar: AppBar(
              title: Text('视频',
                  style: TextStyle(
                      fontFamily: '${theme['fontFamily']}',
                      fontSize: ScreenUtil().setSp(60))),
              centerTitle: true),
          drawer: drawerWidget(context),
          body: MainVideo(),
        );
      },
    );
  }
}

class MainVideo extends StatefulWidget {
  @override
  _MainVideoState createState() => _MainVideoState();
}

class _MainVideoState extends State<MainVideo> {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();
  int page = 1; // 第一个数据标示
  List results = []; // 数据数组
  void initState() {
    super.initState();
    _getVideoData();
  }

  // 获取视频一级数据
  void _getVideoData() async {
    await get('videoContent', formData: page).then((val) {
      var data = json.decode(val.toString());
      VideoContextModel model = VideoContextModel.fromJson(data);
      setState(() {
        results.addAll(model.results);
        page++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return results.length > 0
        ? EasyRefresh(
            key: _easyRefreshKey,
            refreshHeader: BezierCircleHeader(
              key: _headerKey,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            refreshFooter: BezierBounceFooter(
              key: _footerKey,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: results.length > 0 ? _waterFall() : _noData(),
            onRefresh: () {
              setState(() {
                results = [];
              });
              page = 1;
              _getVideoData();
            },
            loadMore: () {
              _getVideoData();
            },
          )
        : _noData();
  }

  // 没有数据时展示
  Widget _noData() {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            results = [];
          });
          page = 1;
          _getVideoData();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('空空无也,点我重新加载^_^'),
            Image.asset('images/pages/noData.jpeg')
          ],
        ),
      ),
    );
  }

  // 瀑布流
  Widget _waterFall() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) => Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => new VideoDetails(
                            
                          ),
                    ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/pages/placeholder.jpg',
                      fit: BoxFit.fill,
                      image: results[index].url,
                    ),
                  ),
                  Text('点我看美女🛀' + '--' + results[index].desc),
                ],
              ),
            ),
          ),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 3 : 4),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
