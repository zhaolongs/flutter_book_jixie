import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),));

//4.7
//4.7 SliverAppBar使用分析

//页面FirstPage
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

  ///4.7 /lib/code3/main_data56.dart
  ///SliverAppBar 配置可折叠的布局
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool b) {
          return [
            SliverAppBar(
              //可折叠的高度
              expandedHeight: 112,
              ///用于折叠的布局
              flexibleSpace:buildFlexibleSpace(),
              //bottom固定在顶部
              pinned: true,
              //隐藏标题部分 leading、title、actions等
              floating: true,

              ///标题
              title: Text(" 配制"),
              leading: Icon(Icons.home),
              actions: <Widget>[
                Icon(Icons.share),
              ],
              bottom: buildBottom(),
            ),
          ];
        },
        ///主体部分
        body: buildBody(),
      ),
    );
  }

  ///一张图片
  Widget buildFlexibleSpace() {
    //一般是44
    double top = MediaQuery.of(context).padding.top;
    print("上边刘海高度$top");
    //般AppBar的高度是 kToolbarHeight的值 56.0
    print("AppBar的高度是$kToolbarHeight");
    return Image(image: AssetImage("assets/images/2.0x/head1.png"),height: 190,fit: BoxFit.fill,);
  }

  Widget buildFlexibleSpace2() {
    //一般是44
    double top = MediaQuery.of(context).padding.top;
    print("上边刘海高度$top");
    //般AppBar的高度是 kToolbarHeight的值 56.0
    print("AppBar的高度是$kToolbarHeight");
    return FlexibleSpaceBar(
      titlePadding: EdgeInsets.zero,
      centerTitle: true,
      background: Container(
        color: Colors.blue[300],
        child: Image(image: AssetImage("assets/images/2.0x/head1.png"),height: 150,fit: BoxFit.fill,),
      ),
    );
  }

  Widget buildBody() {
    return TabBarView(controller: tabController, children: <Widget>[
      Container(
        child: Text("这是第一个页面"),),
      Text("这是第二个页面", style: TextStyle(color: Colors.blue),),
      Text("这是第三个页面", style: TextStyle(color: Colors.red),),
    ],);
  }

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