import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),));

//4.7 /lib/code3/main_data55.dart
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

  @override
  Widget build(BuildContext context) {
    //一般是44
    double top = MediaQuery.of(context).padding.top;
    print("上边刘海高度$top");
    //般AppBar的高度是 kToolbarHeight的值 56.0
    print("AppBar的高度是$kToolbarHeight");
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool b) {
          return [
            SliverAppBar(
              ///标题
              title: Text(" 配制"),
              leading: Icon(Icons.home),
              actions: <Widget>[
                Icon(Icons.share),
              ],
              bottom: TabBar(
                controller: tabController,
                tabs: <Widget>[
                  new Tab(text: "标签一",),
                  new Tab(text: "标签二",),
                  new Tab(text: "标签三",),
                ],
              ),
            ),
          ];
        },

        ///主体部分
        body: TabBarView(controller: tabController, children: <Widget>[

          Container(
            child: Text("这是第一个页面"),),
          Text("这是第二个页面", style: TextStyle(color: Colors.blue),),
          Text("这是第三个页面", style: TextStyle(color: Colors.red),),
        ],),
      ),
    );
  }
}