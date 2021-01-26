
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/SocketManage.dart';

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
