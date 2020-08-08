
//2.2MaterialApp的基本使用
//lib/code1/main_data1.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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


//2.6.3 lib/code1/main_data5.dart
//NavigatorObservers实战
//页面FirstPage
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("点击跳转第二个页面"),
          onPressed: (){
            //跳转第二个页面
            Navigator.of(context).pushNamed("/scend");
          },
        ),
      ),
    );
  }
}
//2.6.3 NavigatorObservers实战
//页面ScendPage
class ScendPage extends StatefulWidget {
  @override
  _ScendPageState createState() => _ScendPageState();
}

class _ScendPageState extends State<ScendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("点击返回第一个页面"),
          onPressed: (){
            Navigator.of(context).pop();
          },
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

//2.6.3 lib/code1/main_data5.dart
//NavigatorObservers实战
//创建自定义路由观察者MyNavigatorObservers
class MyNavigatorObservers extends NavigatorObserver {
  // 当调用Navigator.push时回调
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    print("didPush目标的路由名称是 " + route.settings.name.toString());
    //print("didPush目标的路由是否是InitialRoute配置的初始化路由 " + route.settings.isInitialRoute.toString());
    print("didPush目标的路由携带的参数 " + route.settings.arguments.toString());
    if (previousRoute != null) {
      print("上一个路由的名称是 " + previousRoute.settings.name.toString());
    }else{
      //当为第一个初始化页面时 previousRoute是为null的
    }
  }
  // 当调用Navigator.pop时回调
  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    print("didPop 目标的路由名称是 " + route.settings.name.toString());
    //print("didPop 目标的路由是否是InitialRoute配置的初始化路由 " + route.settings.isInitialRoute.toString());
    print("didPop 目标的路由携带的参数 " + route.settings.arguments.toString());
    if (previousRoute != null) {
      print("didPop 上一个路由的名称是 " + previousRoute.settings.name.toString());
    }else{
      //当为第一个初始化页面时 previousRoute是为null的
    }
  }
  // 当调用Navigator.Remove时回调
  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
  }
}



