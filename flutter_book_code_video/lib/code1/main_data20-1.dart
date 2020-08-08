
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///应用入口 
main() =>
    runApp(
        MaterialApp(
        showSemanticsDebugger: true,
          home: FirstPage(),));

///4.9 /lib/code3/main_data60.dart
///FlexibleSpaceBar使用分析
///SliverAppBar 配置可折叠的布局
///经内内容布局效果
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>{



  @override
  Widget build(BuildContext context) {
    return buildBodyFunction();
  }


  Widget buildBodyFunction() {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){},icon: Icon(Icons.share),),
          IconButton(onPressed: (){},icon: Icon(Icons.message),),],
        title: Text("这是一个标题"),
        leading: IconButton(onPressed: (){},icon: Icon(Icons.close),),
        centerTitle: true,
        brightness: Brightness.light,
      ),
      body: Center(child: Text("内容主体"),),);
  }

  Widget buildBodyFunction2() {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool b) {
          return [
            SliverAppBar(
              actions: [],
            elevation: 12,

              centerTitle: true,
              //固定在顶部
              pinned: true,

              title: Text("这是一个标题"), leading: Icon(Icons.home),)
          ];
        },
        body: Center(child: Text("内容主体"),),),);
  }

}