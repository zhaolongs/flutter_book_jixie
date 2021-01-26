import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
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
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example1009(),
  ));
}

class Example1009 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State {
  String _netData = "";
  IOWebSocketChannel channel;
  String _text = "";

  @override
  void initState() {
    super.initState();
    //创建websocket连接
    channel = new IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  @override
  void dispose() {
    channel.sink.close();
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
                channel.sink.add('Hello!');
              },
            ),
            new StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                //网络不通会走到这
                if (snapshot.hasError) {
                  _text = "网络不通...";
                } else if (snapshot.hasData) {
                  _text = "echo: " + snapshot.data;
                }
                return new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: new Text(_text),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
