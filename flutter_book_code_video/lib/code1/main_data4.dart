
//2.2MaterialApp的基本使用
//lib/code1/main_data1.dart
import 'package:flutter/material.dart';



//2.5 lib/code1/main_data2.dart
//路由routes配置 方式一
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

              Navigator.of(context).pushNamed('/sec');
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



