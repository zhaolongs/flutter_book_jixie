import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///

///代码清单 2-12
///lib/code/code2/example_206_MaterialApp_page.dart
//应用入口
main() => runApp(themDataFunction());

MaterialApp themDataFunction() {
  return MaterialApp(
    theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Colors.deepPurple),
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData(),

    //加载显示的首页面
    home: MyHomePage(),
  );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            //显示日期组件
            showDatePicker(
                    context: context,
                    //初始日期设置为现在
                    initialDate: new DateTime.now(),
                    //开始日期
                    firstDate:
                        new DateTime.now().subtract(new Duration(days: 30)),
                    //结束日期
                    lastDate: new DateTime.now().add(new Duration(days: 30)))
                .then((v) {});
          },
          child: Text("点击显示日期 "),
        ),
      ),
    );
  }
}
