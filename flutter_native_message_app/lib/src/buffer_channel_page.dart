import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
class BufferChannelPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<BufferChannelPage> {
  ///回传的消息标识
  String reciverStr = "";

  //代码清单9-1-28
  @override
  void initState() {
    super.initState();
    // Flutter端接收
    ServicesBinding.instance.defaultBinaryMessenger.setMessageHandler('test',
        (ByteData message) async {
      ///处理消息
      final ReadBuffer readBuffer = ReadBuffer(message);
      final double x = readBuffer.getFloat64();
      final int n = readBuffer.getInt32();
      print('Received $x and $n');
      return null;
    });
  }

  //设置消息监听

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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  ///代码清单 9-1-25
  void sendMessage() async {
    //向平台发送二进制消息.
    final WriteBuffer buffer = WriteBuffer()
      ..putFloat64(1.1415)
      ..putInt32(2341);
    final ByteData message = buffer.done();

    //过时 v1.6.5 之后不建议使用
    //await BinaryMessages.send('foo', message);

    //过时 v1.6.5 之后不建议使用
    //await defaultBinaryMessenger.send('foo', message);

    //使用默认创建的 BinaryMessenger
    BinaryMessenger binar = ServicesBinding.instance.defaultBinaryMessenger;
    //发送消息
    ByteData byteData = await binar.send('test', message);
    //
    print('Message sent, reply ignored');
  }
}
