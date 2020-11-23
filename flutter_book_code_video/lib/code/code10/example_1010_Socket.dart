import 'dart:convert';
import 'dart:io' as IO;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/SocketManage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:web_socket_channel/io.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example1010(),
  ));
}

class Example1010 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State {

  String _text = "";

  @override
  void initState() {
    super.initState();
    SocketManage.initSocket();
  }

  @override
  void dispose() {
    SocketManage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" WebSocket "),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        //关键代码
        child: Column(
          children: [
            TextButton(
              child: Text("发送"),
              onPressed: () {

                SocketManage.mStream.listen(onReceiver);
                SocketManage.addParams([1,2,3]);

              },
            ),
          ],
        ),
      ),
    );
  }

  //接收返回值
  void onReceiver(dynamic event) {
    debugPrint('event listen :$event');
  }

}
