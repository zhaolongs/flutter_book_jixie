import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_life_state/flutter_life_state.dart';
import 'package:flutterbookcode/app/common/global.dart';
import 'package:flutterbookcode/app/page/common/app_upgrade.dart';
import 'package:flutterbookcode/app/page/common/user_protocol_page.dart';
import 'package:flutterbookcode/utils/flutter_toast_utils.dart';
import 'package:flutterbookcode/utils/toast_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/11/27.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572



void main() {
  ///启动根目录
  runApp(MaterialApp(
    navigatorKey: globalNavigatorKey,
    home: TestToastPage(),
  ));
}

/// 代码清单
///测试Toast
class TestToastPage extends StatefulWidget {
  @override
  _TestToastPageState createState() => _TestToastPageState();
}

class _TestToastPageState extends BaseLifeState<TestToastPage> {
  String currentText = "";

  int number =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("短消息提示"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [

              SizedBox(
                height: 44,
              ),
              ElevatedButton(
                child: Text("显示Toast"),
                onPressed: () {
                  ToastUtils.showToast("这是消息提示框");
                },
              ),
              ElevatedButton(
                child: Text("显示 Flutter 消息提示框"),
                onPressed: () {
                  number++;
                  FlutterToastUtils.show(context: context,message: "这是消息提示框 $number");
                },
              ),
              ElevatedButton(
                child: Text("显示 用户隐私协议"),
                onPressed: () {
                  //便捷弹出 用户协议 与 隐私协议 弹框
                  showUserProtocolPage(context: context);
                },
              ),
            ],
          )),
    );
  }
}
