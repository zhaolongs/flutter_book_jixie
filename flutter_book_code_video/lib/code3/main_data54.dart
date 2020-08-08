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
        leading: Icon(Icons.close),
        ///右侧图标区域
        actions: [
          Container(child: Icon(Icons.message),margin: EdgeInsets.only(right: 12),),
          Container(child: Icon(Icons.share),margin: EdgeInsets.only(right: 12),),
        ],
        bottom: buildAppBarTitle(),
        centerTitle: true,
      ),
      body: Center(child: Text("AppBar组件"),),
    );
  }
  //构建TabBar
  PreferredSize buildAppBarTitle() {
    //PreferredSize
    return PreferredSize(
      ///bottom的高度设置
      preferredSize: Size.fromHeight(44),
      ///bottom的子widget
      child: Container(
        color: Colors.white,
        height: 44,
        child:
        Row(
          ///子布局居中
          mainAxisAlignment: MainAxisAlignment.center,
          ///两个子木筏，
          children: [
            Text("测试标签1"),
            ///SizedBox 这里可理解为是用来填充空间的
            SizedBox(width: 20,),
            Text("测试标签2"),
          ],),),
    );
  }
}