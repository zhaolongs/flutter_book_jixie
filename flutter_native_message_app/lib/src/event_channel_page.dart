import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/13.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单9-17 EventChannel 的基本使用
/// lib/src/event_channel_page.dart
class EventChannelPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<EventChannelPage> {
  ///回传的消息标识
  String reciverStr = "";

  //创建 EventChannel
  static const eventChannel = const EventChannel('flutter_and_native_103');
  ///消息流
  StreamSubscription _streamSubscription;

  //代码块9-1-32
  @override
  void initState() {
    super.initState();
    ///设置监听
    _streamSubscription =
        eventChannel.receiveBroadcastStream().listen((Object event) {
          ///成功消息回调
      setState(() {
        reciverStr = "回传数据: " + event.toString();
      });
    }, onError: (Object event) {
          ///失败消息回调
      setState(() {
        reciverStr = "回传数据: " + event.toString();
      });
    });
  }
  //代码块9-1-33
  @override
  void dispose() {
    super.dispose();
    ///移除监听
    if(_streamSubscription!=null){
      _streamSubscription.cancel();
      _streamSubscription=null;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventChannel 与原生  Android iOS的通信 Demo"),
      ),
      backgroundColor: Colors.white,
      ///填充布局
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              color: Colors.grey[300],
              child: Text("原生回传:$reciverStr"),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(12),
            ),
          ],
        ),
      ),
    );
  }
}
