import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///应用入口 
main() =>
    runApp(
        MaterialApp(
          //查看语义视图
          showSemanticsDebugger: false,
          home: FirstPage(),));


//4.5.2 /lib/code3/main_data52-2.dart
// iconTheme 的配置使用

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

//4.5.2 /lib/code3/main_data52-2.dart
// iconTheme 的配置使用
class ScendPageState extends State<ScendPage> {
  //页面创建时执行的第一个方法
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: FlatButton(
          child: Text("点击返回第一个页面"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      endDrawer: Container(width: 100, color: Colors.white,),
    );
  }

  //4.5.2 /lib/code3/main_data52-2.dart
  // iconTheme 的配置使用
  AppBar buildAppBar() {
    return AppBar(
      title: Text("第二个页面"),
      ///AppBar中通用Icon的样式配置
      iconTheme: IconThemeData(
        ///紫色
        color: Colors.deepOrange,
        ///大小
        size:44,
        ///透明度
        opacity: 1,
      ),
      actionsIconTheme:IconThemeData(
      ///紫色
      color: Colors.yellow,
      ///大小
      size:33,
      ///透明度
      opacity: 1,
    ),
      leading: Icon(
        Icons.arrow_back,),
      ///右侧图标区域
      actions: [
        Container(
          child: Icon(Icons.message), margin: EdgeInsets.only(right: 12),),
        Container(
          child: Icon(Icons.share), margin: EdgeInsets.only(right: 12),),
      ],
    );
  }
}