
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),));

///4.8 /lib/code3/main_data59.dart
///FlexibleSpaceBar使用分析
///SliverAppBar 配置可折叠的布局
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool b) {
          return [
            SliverAppBar(
              //固定在顶部
              pinned: true,
              //隐藏标题部分 leading、title、actions等
              floating:true,
              //可折叠的高度
              expandedHeight: 168,
              ///用于折叠的布局
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.blue[300],
                  //一张图片
                  child: Image(image: AssetImage("assets/images/2.0x/head1.png"),
                    fit: BoxFit.fill,),
                ),
                  stretchModes:[
                    StretchMode.fadeTitle
                  ]
              ),

              ///标题
              title: Text(" 配制"),
              leading: Icon(Icons.home),
              actions: <Widget>[
                Icon(Icons.share),
              ],
              ///
//              bottom: PreferredSize(
//                preferredSize: Size.fromHeight(44),
//                child: Container(),
//
//              ),
            ),
          ];
        },

        ///主体部分
        body: buildBody(),
      ),
    );
  }

  ///页面的主体部分
  Widget buildBody() {
    return TabBarView(controller: tabController, children: <Widget>[
      Container(
        child: Text("这是第一个页面"),),
      Text("这是第二个页面", style: TextStyle(color: Colors.blue),),
      Text("这是第三个页面", style: TextStyle(color: Colors.red),),
    ],);
  }

  ///AppBar中bottom部分
  Widget buildBottom() {
    return TabBar(
      controller: tabController,
      tabs: <Widget>[
        new Tab(text: "标签一",),
        new Tab(text: "标签二",),
        new Tab(text: "标签三",),
      ],
    );
  }
}