import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/8/7.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
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
