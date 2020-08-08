import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),));

//4.3 /lib/code3/main_data51.dart

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
          onPressed: () {
            Navigator.of(context).push(
              new MaterialPageRoute(
                //是否全屏显示
                fullscreenDialog: true,
                //构建页面
                builder: (_) {
                  return new ScendPage();
                },),);
          },
        ),
      ],),
    );
  }
}

//页面ScendPage
//跳转到第二个页面ScendPage中，在ScendPage中获取上一个页面参数
class ScendPage extends StatefulWidget {
  @override
  ScendPageState createState() => ScendPageState();
}
//4.3 /lib/code3/main_data51.dart
//AppBar的leading属性
class ScendPageState extends State<ScendPage> {
  //页面创建时执行的第一个方法
  @override
  void initState() {
    super.initState();
  }
//4.3 /lib/code3/main_data51.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar1(),
      body: Center(
        child: FlatButton(
          child: Text("点击返回第一个页面"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      ///侧拉页面
      drawer: Container(width: 200,color: Colors.white,),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("第二个页面"),
      leading: Icon(Icons.close),
    );
  }

  AppBar buildAppBar1() {
    return AppBar(
      title: Text("第二个页面"),
      leading: Icon(Icons.close),
    );
  }

  //4.3 /lib/code3/main_data51.dart
  AppBar buildAppBar2() {
    return AppBar(
      title: Text("第二个页面"),
      leading: InkWell(
        onTap: () {
          //退出当前页面
          Navigator.of(context).pop();
        },
        child: Icon(Icons.close),),
    );
  }

  //或者是使用手势识别组件GestureDetector
  AppBar buildAppBar3() {
    return AppBar(
      title: Text("第二个页面"),
      leading: GestureDetector(
        onTap: () {
          //退出当前页面
          Navigator.of(context).pop();
        },
        child: Icon(Icons.close),),
    );
  }
}