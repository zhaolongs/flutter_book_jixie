import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///代码清单2-2 静态路由配置
///lib/code/code2/example_202_MaterialApp_page.dart
void main() => runApp(MyApp2());
//定义根目录Widget
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //配制路由规则
      routes: {
        //默认页面
        "/":(BuildContext context) => MyHomePage (),//默认创建的启动页面
        "/first": (BuildContext context) => FirstPage(),//自定义的页面
        "/second": (BuildContext context) => SecondPage(),//自定义的页面
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Text("这里是首页面"),
    );
  }
}



class FirstPage extends StatelessWidget {
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Text("第一个页面"),
    );
  }
}

class SecondPage extends StatelessWidget {
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Text("第二个页面"),
    );
  }
}
