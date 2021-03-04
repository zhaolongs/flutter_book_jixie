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
/// 代码清单9-12 BasicMessageChannel 双向消息通信
class BasicMessagePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<BasicMessagePage> {

  ///回传的消息标识
  String reciverStr ="";

  //创建MethodChannel
  // 参数一 flutter_and_native_101 为通信标识
  // 参数二 codec 为参数传递的 编码方式，必选
  // 参数三  binaryMessenger 为使用的消息通道默认为
  //    [ServicesBinding.defaultBinaryMessenger]
  static const messageChannel = const BasicMessageChannel(
      'flutter_and_native_100', StandardMessageCodec());

  /// 代码块 9-1-13
  ///发送消息
  Future<Map> sendMessage(Map arguments) async {
    Map reply = await messageChannel.send(arguments);
    //解析 原生发给 Flutter 的参数
    int code = reply["code"];
    String message = reply["message"];

    //更新 Flutter 中页面显示
    setState(() {
      reciverStr = "code:$code message:$message";
    });
    return reply;
  }

  /// 代码块 9-1-15
  void testSendMessage1()async {
    Map<String, dynamic> map = Map();
    map['name'] = "测试";
    map['method'] ="test";

    ///使用 async await 组合来获取结果
    Map result = await sendMessage(map);
    //此方法只会回调一次
    // result 是原生中回传的数据 在这里定义的数据
    //    类型是 Map
    int code = result["code"];
    String message = result["message"];

    ///刷新Demo页面显示
    setState(() {
      reciverStr = "invokNative 中的回调 code $code message $message ";
    });
  }
  @override
  void initState() {
    super.initState();
    //设置BasicMessageChannel的消息监听通道
    receiveMessage();
  }

  /// 代码块 9-1-14
  //接收消息监听
  void receiveMessage() {
    messageChannel.setMessageHandler((result) async {
      //解析 原生发给 Flutter 的参数
      int code = result["code"];
      String message = result["message"];

      setState(() {
        reciverStr = "receiveMessage: code:$code message:$message";
      });
      return 'Flutter 已收到消息';
    });
  }

  /// 代码块 9-1-16
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StandardMessageCodec 与原生  Android iOS的通信 Demo"),
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
              child: Text("原生回传:$reciverStr",style: TextStyle(debugLabel: "测试"),),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(12),
            ),
            RaisedButton(
              child: Text("向原生 Android iOS 中发送消息 "),
              onPressed: () {
              testSendMessage1();
              },
            ),

            RaisedButton(
              child: Text("向原生 Android iOS 中发送消息 有参数 "),
              onPressed: () {
                testSendMessage2();
              },
            ),
          ],
        ),
      ),
    );
  }


  /// 代码块 9-1-17
  void testSendMessage2() async{
    Map<String, dynamic> map = Map();
    map['name'] = "测试";
    map['method'] ="test2";

    ///使用 async await 组合来获取结果
    Map result = await sendMessage(map);
    //此方法只会回调一次
    // result 是原生中回传的数据 在这里定义的数据
    //    类型是 Map
    int code = result["code"];
    String message = result["message"];

    ///刷新Demo页面显示
    setState(() {
      reciverStr = "invokNative 中的回调 code $code message $message ";
    });
  }

}
