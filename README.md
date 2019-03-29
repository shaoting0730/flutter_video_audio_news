# Flutter的实战练习(更新中)


## 版本信息:
  version: 1.0.0+1   <br/>
  environment:   sdk: ">=2.1.0 <3.0.0"  <br/>

### model转换  [https://javiercbk.github.io/json_to_dart/ ]( https://javiercbk.github.io/json_to_dart/  )  <br/>
### state管理  [flutter_bloc ]( https://github.com/felangel/bloc/tree/master/packages/flutter_bloc  )  <br/>


### 使用三方库
 [网络请求库: dio]( https://github.com/flutterchina/dio )  <br/>
 [UI尺寸适配库: flutter_screenutil]( https://github.com/OpenFlutter/flutter_screenutil )  <br/>
 [打电话: url_launcher]( https://github.com/flutter/plugins )  <br/>
 [下拉刷新&上拉加载: flutter_easyrefresh]( https://github.com/xuelongqy/flutter_easyrefresh )  <br/>
 [瀑布流: flutter_staggered_grid_view]( https://github.com/letsar/flutter_staggered_grid_view )  <br/>
 [视频播放: chewie]( https://github.com/brianegan/chewie )  <br/>
 [音乐播放: https://github.com/luanpotter/audioplayers]( https://github.com/luanpotter/audioplayers )  <br/>
 [轮播: flutter_swiper]( https://github.com/best-flutter/flutter_swiper )  <br/>


 
 ### 代码结构
>- |--lib
>    - |-- bloc 
>      - |-- counter_bloc.dart 
>    - |-- config 
>      - |-- service_url.dart (存放url)
>    - |-- model 
>      - |-- video_context_model.dart (视频1级model)
>    - |-- pages (页面)
>      - |-- details  (详情界面)
>        - |-- comment_details.dart (评论)
>        - |-- video_details.dart (视频)
>        - |-- video_info.dart (视频简介)
>      - |-- widget  (小部件)
>        - |-- drawer_widget.dart (侧边栏)
>      - |-- audio_page.dart  (音频)
>      - |-- news_page.dart  (新闻)
>      - |-- video_page.dart  (视频)
>    - |-- service 
>      - |-- service_method.dart (网络请求)
>    - |-- mian.dart  (入口) 
>    - |-- tabbar.dart  (Tabbar) 
>    - |-- top_screen.dart  (把tabbar和state管理分开) 

### 感谢: 
接口来自   [http://gank.io/api]( http://gank.io/api )  <br/>


## 项目截图
### 视频
![image](https://github.com/pheromone/flutter_video_audio_news/blob/master/video.png) <br/>
![image](https://github.com/pheromone/flutter_video_audio_news/blob/master/%E4%BE%A7%E8%BE%B9%E6%A0%8F.png) <br/>
[ios模拟器加载不出视频,只能使用真机测.....]( https://github.com/flutter/flutter/issues/14647 )  <br/>
![image](https://github.com/pheromone/flutter_video_audio_news/blob/master/video_info.png) <br/>
![image](https://github.com/pheromone/flutter_video_audio_news/blob/master/video_info.png) <br/>
![image](https://github.com/pheromone/flutter_video_audio_news/blob/master/video_comment.png) <br/>



### 音频
![image](https://github.com/pheromone/flutter_video_audio_news/blob/master/audio.gif) <br/>
<img src="https://github.com/pheromone/flutter_video_audio_news/blob/master/audio.gif" width = "100" height = "100" div align=right />


...
### 新闻
...
