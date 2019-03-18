import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/counter_bloc.dart';

Drawer drawerWidget(context) {
   final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Drawer(
        child: SingleChildScrollView(
          child: BlocBuilder<CounterEvent,Map>(
            bloc: _counterBloc,
            builder: (BuildContext context, Map theme){
              return  Column(
            children: <Widget>[
              Image.network('https://ws1.sinaimg.cn/large/0065oQSqly1g0ajj4h6ndj30sg11xdmj.jpg'),
              Container(
                child: // 清理缓存
             ListTile(   
              title: new Text('清理缓存'),
              trailing: new Icon(Icons.clear_all),
              onTap: (){},   
            ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black26
                    )
                  )
                ),
              ),
              Container(
                child: // 清理缓存
             ListTile(   
              title: new Text('更换主题'),
              trailing: new Icon(Icons.change_history),
              onTap: (){
                _counterBloc.dispatch(CounterEvent.changeTheme);
              },   
            ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black26
                    )
                  )
                ),
              ),
            
            //退出按钮
            ListTile(   
              title: new Text('关闭'),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),   //点击后收起侧边栏
            ),
            
            ],
           ); 
          }
        ),
      ),
   );
}

