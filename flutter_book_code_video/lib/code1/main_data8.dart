

//2.6.4 /lib/code1/main_data8.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void bookCode(BuildContext context){
  Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
    return new ScendPage();
  }));
//或者是
  Navigator.of(context).push(new CupertinoPageRoute(builder: (_) {
    return new ScendPage();
  }));

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
      body: Column(children: <Widget>[
        FlatButton(
          child: Text("点击跳转第二个页面"),
          onPressed: (){
            //2.6.4 /lib/code1/main_data8.dart
            //动态路由实战
            Map<String, String> map = new Map();
            map["title"] = "234";
            Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
              return new ScendPage();
            }, settings: RouteSettings(name: "/scend", arguments: map),),);

          },
        ),
        FlatButton(
          child: Text("点击跳转第二个页面"),
          onPressed: (){
            //2.6.4 /lib/code1/main_data8.dart
            //动态路由实战 获取ScendPage回传数据
            Map<String, String> map = new Map();
            map["title"] = "234";
            Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
              return new ScendPage();
            }, settings: RouteSettings(name: "/scend", arguments: map),),).then((
                value) {
              //这里的value就是关闭ScendPage页面时 pop函数中回传的数据
              //需要注意的是前后的数据类型要对应起来
            });



          },
        )
      ],),
    );
  }
}
//2.6.3 lib/code1/main_data7.dart
//页面ScendPage
//跳转到第二个页面ScendPage中，在ScendPage中获取上一个页面参数
class ScendPage extends StatefulWidget {
  @override
  ScendPageState createState() => ScendPageState();
}

class ScendPageState extends State<ScendPage> {
  //页面创建时执行的第一个方法
  @override
  void initState() {super.initState();}
  //页面创建执行的第二个方法
  //页面 State、Context已绑定
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //获取路由信息
    RouteSettings routeSettings = ModalRoute.of(context).settings;
    //获取传递的参数
    Map<String,String> arguments = routeSettings.arguments;
    print("接收到参数 ${arguments["title"]}");
  }
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
            //这里是向上一个页面回传的数据
            Map<String,String> resultMap = new Map();
            resultMap["result"]="AESC";
            Navigator.of(context).pop(resultMap);
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



