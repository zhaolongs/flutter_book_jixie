import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

///代码清单 2-16
///lib/code/code2/example_207_scaffold_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/painting.dart';

///代码清单2-7
///lib/code/code2/example_204_MaterialApp_page.dart
///启动默认页面配置方式二
void main() => runApp(MyApp2());
//定义根目录Widget
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //配制路由规则
      routes: {
        //默认页面
        "/":(BuildContext context) => MyHomePage (),
        "/first": (BuildContext context) => FirstPage(),
      },
    );
  }
}
///代码清单2-8
///lib/code/code2/example_204_MaterialApp_page.dart
///启动默认页面配置方式三
class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //配制路由规则
      routes: {
        "/first": (BuildContext context) => FirstPage(),
      },
      initialRoute: "/first",
    );
  }
}

///代码清单2-9
///lib/code/code2/example_204_MaterialApp_page.dart
class MyApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //配制路由规则
      routes: {
        //默认页面
        "/": (BuildContext context) => FirstPage(),
        "/first": (BuildContext context) => FirstPage(),
      },

      //配制404 页面
      onGenerateRoute: (RouteSettings settings) {
        return new MaterialPageRoute(
            builder: (BuildContext contex) => ErrorPage());
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

class ErrorPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("404"),
      ),
      body: Text("出错了"),
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
