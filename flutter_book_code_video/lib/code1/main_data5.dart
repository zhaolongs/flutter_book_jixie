
//2.2MaterialApp的基本使用
//lib/code1/main_data1.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNavigatorObservers extends NavigatorObserver {
  // 当调用Navigator.push时回调
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
  }

  // 当调用Navigator.pop时回调
  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
  }

  // 当调用Navigator.Remove时回调
  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
  }
}


void main() => runApp(RoutesApp());
//定义根目录Widget
class RoutesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //路由配置404
    return
      MaterialApp(
        //配制路由规则
        routes: {
          //默认页面
          "/": (BuildContext context) => FirstPage(),
          "/first": (BuildContext context) => FirstPage(),
          "/scend": (BuildContext context) => ScendPage(),
        },

        //配制404 页面
        onGenerateRoute: (RouteSettings settings) {
          return new MaterialPageRoute(
              builder: (BuildContext contex) => ErrorPage());
        },
        //兼听所有的页面路由
        navigatorObservers: <NavigatorObserver>[
          //创建自定义路由兼听
          MyNavigatorObservers(),
        ],

      );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FirstPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '点击打开一个页面',
            ),
            SizedBox(height: 22,),
            FlatButton(child: Text("打开页面"),onPressed: (){
              Navigator.of(context).pushNamed('/scend');
            },),
          ],
        ),
      ),

    );
  }
}
///错误页面
class ScendPage extends StatefulWidget {
  @override
  _ScendPageState createState() => _ScendPageState();
}

class _ScendPageState extends State<ScendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScendPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(child: Text("返回上一个页面"),onPressed: (){
              Navigator.of(context).pop();
            },),

          ],
        ),
      ),

    );
  }
}

///错误页面
class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("404"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '出错了',
              style: TextStyle(color: Colors.red),
            ),

          ],
        ),
      ),

    );
  }
}



