import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/8/7.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends State<TestPage> {
  HttpClient http = new HttpClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [],
          )),
    );
  }

  void test() async {
    getDataA().then((value1) {
      ///值value1就是getDataA中返回的结果
      getDataB().then((value2) {
        ///值value2就是getDataB中返回的结果
      });
    });

    
  }

  Future<String> getDataA() async {
    String result = "";
    try {
      var httpClient = new HttpClient();
      var uri = new Uri.http(
          'example.com', '/test', {'param1': '42', 'param2': 'foo'});
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      return await response.transform(utf8.decoder).join();
    } catch (e) {
      result = "出现异常";
    } finally {
      return Future.value(result);
    }
  }

  Future<String> getDataB() async {
    String result = "";
    try {
      var httpClient = new HttpClient();
      var uri = new Uri.http(
          'example.com', '/test', {'param1': '42', 'param2': 'foo'});
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      return await response.transform(utf8.decoder).join();
    } catch (e) {
      result = "出现异常";
    } finally {
      return Future.value(result);
    }
  }
}
