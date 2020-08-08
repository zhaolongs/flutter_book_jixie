
//2.2MaterialApp的基本使用
//lib/code1/main_data1.dart
import 'package:flutter/material.dart';




void bookCode(BuildContext context){
  Navigator.of(context).pushNamed('/second');
// 带返回值
  Navigator.of(context).pushNamed('/second').then((value) {
// 这里的 value 就是 打开的 /router/second对应的页面关闭时回传的数据
  });
//方式二 可称作是动态路由
  Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
//ScendPage就是我们要打开的目标页面
    return new ScendPage();
  }),);

  Navigator.of(context).pop('这个是要返回给上一个页面的数据');
  //或者是
  Navigator.of(context).pop();

}

//程序的入口
//void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
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



