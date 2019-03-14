import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';


// 获取数据
Future get(url,{formData}) async {
  try {
    print('开始获取数据↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓');
    var contextUrl = servicePath[url] + formData.toString();
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    response = await dio.get(contextUrl);
    return response;
  } catch (e) {
    print('ERROR 如下');
    return  print(e);
  }
}