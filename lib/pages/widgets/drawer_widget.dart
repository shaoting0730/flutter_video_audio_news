import 'package:flutter/material.dart';

Drawer drawerWidget(context) {
  
    return Drawer(
        child: Column(
          children: <Widget>[
            Image.network('https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg'),
            ListTile(   //退出按钮
              title: new Text('Close'),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),   //点击后收起侧边栏
            ),
          ],
        ),
      );
}