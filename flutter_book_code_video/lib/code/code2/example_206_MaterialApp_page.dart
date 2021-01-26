import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
