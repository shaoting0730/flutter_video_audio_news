import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // UI适配库

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('NewsPage')), body: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class TabTitle {
  String title;
  int id;

  TabTitle(this.title, this.id);
}

class HomeState extends State<MyHomePage> with SingleTickerProviderStateMixin {
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
      new TabTitle('简介', 1),
      new TabTitle('评论', 0),
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
        Container(
          color: new Color(0xfff4f5f6),
          height: 38.0,
          width: ScreenUtil().setWidth(750),
          child: TabBar(
            isScrollable: true,
            //是否可以滚动
            controller: mTabController,
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
              return Text(tabList[index].title);
            },
          ),
        )
      ],
    );
  }
}
