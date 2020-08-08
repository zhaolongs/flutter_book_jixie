//4.1 /lib/code3/main_data41.dart
//bottomNavigationBar配制底部导航栏菜单
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///应用入口 
main() => runApp( MaterialApp(home: FirstPage(),));

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPagetate();
  }
}
class FirstPagetate extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    ///Scaffold 用来搭建页面的主体结构
    return Scaffold(
      ///标题
      appBar: AppBar(title: Text("首页标题"),),
      ///页面的主内容区
      body: Center(child: Text("首页面"),),);
  }
}
