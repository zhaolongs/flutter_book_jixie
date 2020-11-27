import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/time_date_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/11/27.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: TestTimeDatePage(),
  ));
}

/// 代码清单
///测试日期时间操作工具类
class TestTimeDatePage extends StatefulWidget {
  @override
  _TestTimeDatePageState createState() => _TestTimeDatePageState();
}

class _TestTimeDatePageState extends State<TestTimeDatePage> {
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("日期时间"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(border: Border.all()),
                child: Text("$currentText"),
              ),
              ElevatedButton(
                child: Text("String 转 DateTime"),
                onPressed: () {
                  DateTime dateTime =
                      TimeDateUtils.getDateTimeByStr(dateStr: "2020-11-11");
                  setState(() {
                    currentText = dateTime.toString();
                  });
                },
              ),
              ElevatedButton(
                child: Text("当前时间 毫秒"),
                onPressed: () {
                  int dateTime = TimeDateUtils.getNowDateMs();
                  setState(() {
                    currentText = dateTime.toString();
                  });
                },
              ),
              ElevatedButton(
                child: Text("当前时间 指定格式"),
                onPressed: () {
                  String dateTime = TimeDateUtils.getNowDateStr();
                  setState(() {
                    currentText = dateTime.toString();
                  });
                },
              ),
              ElevatedButton(
                child: Text("String 转 String"),
                onPressed: () {
                  String dateTime = TimeDateUtils.formatDateByStr(
                      dateStr: "2020-11-11 06:08:66", format: "MM月DD日");
                  setState(() {
                    currentText = dateTime.toString();
                  });
                },
              ),
              ElevatedButton(
                child: Text("13位毫秒 转 String"),
                onPressed: () {
                  String dateTime = TimeDateUtils.formatDateByMill(milliseconds: 1606438828697);
                  setState(() {
                    currentText = dateTime.toString();
                  });
                },
              ),

            ],
          )),
    );
  }


}
