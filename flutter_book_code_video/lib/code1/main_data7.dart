
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
      body: Column(children: <Widget>[
        FlatButton(
          child: Text("点击跳转第二个页面 不接收回传的值"),
          onPressed: (){
            //跳转第二个页面
            Map<String,String> map = new Map();
            map["title"]="ABCS321A";
            //跳转第二个页面
            //[arguments]传到第二个页面的参数
            Navigator.of(context).pushNamed("/scend",arguments: map);

          },
        ),
        FlatButton(
          child: Text("点击跳转第二个页面 接收回传的值 "),
          onPressed: (){
            Map<String,String> map = new Map();
            map["title"]="ABCS321A";
            //跳转第二个页面
            //[arguments]传到第二个页面的参数
            Navigator.of(context).pushNamed("/scend",arguments: map).then((value){
              Map<String,String> resultMap = value;
              print("页面二回传的数据是 ${resultMap['result']}");
            } );


          },
        ),
        FlatButton(
          child: Text(" 动态路由 点击跳转第二个页面  "),
          onPressed: (){

            //跳转第二个页面
            Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
              ///直接通过构建函数来传参数
              return new ScendPage(title:"这是传递的参数");
            })).then((value){
              if(value){
                Map<String,String> resultMap = value;
                print("页面二回传的数据是 ${resultMap['result']}");
              }
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
  final String title;
  ScendPage({@required this.title});
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

    ///是否是路由栈中的第一个页面
    bool isFirst = ModalRoute.of(context).isFirst;
    ///当前手机屏幕上显示的是否是这个页面Widget
    bool isCurrent = ModalRoute.of(context).isCurrent;
    ///当前Widget是否是活跃可用的
    ///当调用 pop 或者是关闭当前Widget时 isActive 为false
    bool isActive = ModalRoute.of(context).isActive;

    if(isActive){
      //获取路由信息
      RouteSettings routeSettings = ModalRoute.of(context).settings;
      //获取传递的参数
      Map<String,String> arguments = routeSettings.arguments;
      print("接收到参数 ${arguments["title"]} isCurrent$isCurrent isFirst$isFirst  isActive$isActive");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面 ${widget.title}"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("点击返回第一个页面"),
          onPressed: (){
            //这里是向上一个页面回传的数据
            Map<String,String> resultMap = new Map();
            resultMap["result"]="AESC";
            ///回传数据
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



