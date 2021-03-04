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
/// 代码清单
class MethodChannelPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}
///代码清单9-1 MethodChannel 双向通信基本使用
///lib/src/method_channel_page.dart
class _TestPageState extends State<MethodChannelPage> {
  ///回传的消息标识
  String reciverStr = "";

  //创建MethodChannel
  // 参数一 flutter_and_native_101 为通信标识
  // 参数二 codec 为参数传递的 编码方式，非必选 默认 StandardMessageCodec()
  // 参数三  binaryMessenger 为使用的消息通道默认为
  //    [ServicesBinding.defaultBinaryMessenger]
  static const methodChannel = const MethodChannel('flutter_and_native_101');



  //封装 Flutter 向 原生中 发送消息 的方法
  //method 为方法标识
  //arguments 为传递的参数
  static Future<dynamic> invokNative(String method,
      {Map<String, dynamic> arguments}) async {
    if (arguments == null) {
      //无参数发送消息
      return await methodChannel.invokeMethod(method);
    } else {
      //有参数发送消息
      return await methodChannel.invokeMethod(method, arguments);
    }
  }

  //代码块9-11 设置MethodCallHandler消息监听 获取原生发送的消息
  @override
  void initState() {
    super.initState();
    ///设置监听
    nativeMessageListener();
  }

  //设置消息监听
  Future<dynamic> nativeMessageListener() async {
    methodChannel.setMethodCallHandler((resultCall) {
      //处理原生 Android iOS 发送过来的消息
      MethodCall call = resultCall;

      String method = call.method;
      Map arguments = call.arguments;

      int code = arguments["code"];
      String message = arguments["message"];

      setState(() {
        reciverStr += " code $code message $message and method $method ";
      });
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MethodChannel 与原生  Android iOS的通信 Demo"),
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
            RaisedButton(
              child: Text("向原生 Android iOS 中发送消息 "),
              onPressed: () {
                sendMessage();
              },
            ),
            RaisedButton(
              child: Text("测试 原生向Flutter中主动回传数据"),
              onPressed: () {
                sendMessage4();
              },
            ),
          ],
        ),
      ),
    );
  }

  ///代码清单9-2 向Android、iOS原生中发送消息
  void sendMessage() {
    ///使用 then 函数来获取异步回调结果
    invokNative("test")
      ..then((result) {
        //此方法只会回调一次
        // result 是原生中回传的数据 在这里定义的数据
        //    类型是 Map
        int code = result["code"];
        String message = result["message"];

        ///刷新Demo页面显示
        setState(() {
          reciverStr = "invokNative 中的回调 code $code message $message ";
        });
      });
  }

  ///代码清单9-3 向Android、iOS原生中发送消息
  void sendMessage2() async {
    ///使用 async await 组合来获取结果
    Map result = await invokNative("test");
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

  ///代码清单
  void sendMessage3() async {
    Map<String, dynamic> map = Map();
    map['name'] = "测试";

    ///使用 async await 组合来获取结果
    Map<dynamic, dynamic> result = await invokNative("test", arguments: map);
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

  ///原生向Flutter中主动回传数据
  ///代码清单
  void sendMessage4() async {
    Map<String, dynamic> map = Map();
    map['name'] = "测试";

    ///使用 async await 组合来获取结果
    Map<dynamic, dynamic> result = await invokNative("test2", arguments: map);
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
