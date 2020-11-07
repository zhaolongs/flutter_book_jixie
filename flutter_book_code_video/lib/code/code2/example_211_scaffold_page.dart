import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///


//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example211(),
  ));
}

///代码清单 2-19
///lib/code/code2/example_211_scaffold_page.dart
class Example211 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example211> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //页面的头部
      appBar: buildAppBar2(),
      //左侧侧拉页面
      drawer: buildDrawerHeader(),
      //页面的主内容区
      //可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: Container(
        padding: EdgeInsets.all(20),
        child: buildDrawerHeader(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("测试"),
      //自定义AppBar左侧的按钮
      leading: IconButton(
        icon: Icon(Icons.access_alarm),
        //点击事件
        onPressed: () {
          // 打开左侧拉页面
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }

  ///代码清单 2-20
  ///lib/code/code2/example_211_scaffold_page.dart
  AppBar buildAppBar2() {
    return AppBar(
      title: Text("测试"),
      //自定义AppBar左侧的按钮
      leading: Builder(
        //使用Builder包裹后，Scaffold.of中使用Builder中回调的context
        //这个context的父级就是ScaffoldState了
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.access_alarm),
            //点击事件
            onPressed: () {
              // 打开左侧拉页面
              Scaffold.of(context).openDrawer();
              // 打开右侧拉页面
              Scaffold.of(context).openEndDrawer();
            },
          );
        },
      ),
    );
  }
  ///代码清单 2-21
  ///lib/code/code2/example_211_scaffold_page.dart
  UserAccountsDrawerHeader buildDrawerHeader() {
    ///通用用户信息组件
    return UserAccountsDrawerHeader(
      //显示的二级标题
      accountEmail: Text('928***994@qq.com'),
      //显示的小标题
      accountName: Text('这里是 accountName'),
      //小箭头点击响应
      onDetailsPressed: () {},
      //当前显示的背景图片
      // CircleAvatar 用来将子 Widget切割为圆形
      currentAccountPicture: CircleAvatar(
        child: Icon(Icons.message),
      ),
    );
  }
}
