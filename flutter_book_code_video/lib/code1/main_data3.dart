
//2.2MaterialApp的基本使用
//lib/code1/main_data1.dart
import 'package:flutter/material.dart';



//2.4 lib/code1/main_data2.dart
//路由routes配置 方式一
void main() => runApp(RoutesApp());
//定义根目录Widget
class RoutesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //配制路由规则
      routes: {
        //默认页面
        "/": (BuildContext context) => FirstPage(),
        "/first": (BuildContext context) => FirstPage(),
      },
    );
  }
}
//路由routes配置 方式二
class RoutesApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

//路由routes配置 方式三
//定义根目录
class RoutesApp3 extends StatelessWidget {
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




class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ///路由保存
    Map<String, WidgetBuilder> routeMap = new Map();
    //这里/first路由名称对应 FirstPage页面
    routeMap["/first"] = (_) => FirstPage();
    routeMap["/scend"] = (_) => ScendPage();
    routeMap["/three"] = buildThreePage();
    return MaterialApp(
      title: 'Flutter Demo',
      routes: routeMap,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }

}

  WidgetBuilder buildThreePage() {
    return (BuildContext context) {
      return ThreePage();
    };
  }

class MyAppState  extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
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
              'You have pushed the button this many times:',
            ),

          ],
        ),
      ),

    );
  }
}
///第二个页面
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


          ],
        ),
      ),

    );
  }
}
class ThreePage extends StatefulWidget {
  @override
  _ThreePageState createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ThreePage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


          ],
        ),
      ),

    );
  }
}



