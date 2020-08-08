//3.3 /lib/code2/main_data35.dart
//bottomNavigationBar配制底部导航栏菜单
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//应用入口 
main() =>
    runApp(MaterialApp(
      home: FirstPage(),),);

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstThemState();
  }
}
class FirstThemState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //页面的头部
      appBar: AppBar(title: Text("标题"),),
      //页面的主内容区
      //可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: bodyWidgetList[_tabIndex],
      //底部导航栏
      bottomNavigationBar: buildBottomNavigation(),
      //固定的标签栏
      bottomSheet: Container(
        color: Colors.blue, height: 44, child: Row(children: <Widget>[
        Container(margin: EdgeInsets.only(left: 10, right: 2),
          color: Colors.white,
          child: Text("标签1"),),
        Container(margin: EdgeInsets.only(left: 10, right: 2),
          color: Colors.white,
          child: Text("标签1"),),
        Container(margin: EdgeInsets.only(left: 10, right: 2),
          color: Colors.white,
          child: Text("标签1"),),
        Container(margin: EdgeInsets.only(left: 10, right: 2),
          color: Colors.white,
          child: Text("标签1"),),

      ],),),

    );
  }

  //选中的标签
  int _tabIndex =0;
  //底部导航栏使用到的图标
  List<Icon> normalIcon = [
    Icon(Icons.home),
    Icon(Icons.message),
    Icon(Icons.people)
  ];
  //底部导航栏使用到的标题文字
  List<String> normalTitle =[
    "首页",
    "消息",
    "我的"
  ];
  List<Widget> bodyWidgetList=[
    ScffoldHomeItemPage(0),
    ScffoldHomeItemPage1(1),
    ScffoldHomeItemPage2(2),
  ];
//构建底部导航栏
  BottomAppBar buildBottomNavigation(){
    return BottomAppBar(
      //底部导航栏的背景
      color: Colors.white,
      //Row中的子Widget在水平方向不线性排列
      child: Row(
        //使用每一个子Widget平均分配Row的宽度
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildBotomItem( 0, Icons.home, "首页"),
          buildBotomItem( 1, Icons.message, "消息"),
          buildBotomItem( 2, Icons.people, "我的"),
        ],
      ),
    );
  }
//3.5 /lib/code2/main_data37.dart
//BottomAppBar配制底部导航栏菜单  图标与代码的组合
//[index] 每个条目对应的角标
//[iconData] 每个条目对就的图标
//[title] 每个条目对应的标题
  buildBotomItem( int index, IconData iconData, String title) {
    //未选中状态的样式
    TextStyle textStyle = TextStyle(fontSize: 12.0,color: Colors.grey);
    MaterialColor iconColor = Colors.grey;
    double iconSize=20;
    EdgeInsetsGeometry padding =  EdgeInsets.only(top: 8.0);

    if(_tabIndex==index){
      //选中状态的文字样式
      textStyle = TextStyle(fontSize: 13.0,color: Colors.blue);
      //选中状态的按钮样式
      iconColor = Colors.blue;
      //tqkh状态图标的大小
      iconSize=25;
      padding =  EdgeInsets.only(top: 6.0);
    }
    //上下竖直方向排列的图标与标题文字
    Widget padItem = Padding(
      padding: padding,
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              Icon(
                iconData,
                color: iconColor,
                size: iconSize,
              ),
              Text(
                title,
                style: textStyle,
              )
            ],
          ),
        ),
      ),
    );
    //Row中通过Expanded进权重布局排列
    Widget item = Expanded(
      flex: 1,
      child: new GestureDetector(
        onTap: () {
          if (index != _tabIndex) {
            setState(() {
              _tabIndex = index;
            });
          }
        },
        child: SizedBox(
          height: 52,
          child: padItem,
        ),
      ),
    );
    return item;
  }

}



//bottomNavigationBar结合独立的StatefulWidget使用 首页面
class ScffoldHomeItemPage extends StatefulWidget {
  //页面标识
  int pageIndex;
  //构造函数
  ScffoldHomeItemPage(this.pageIndex,{Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ScffoldHomeItemState();
  }
}
class ScffoldHomeItemState extends State<ScffoldHomeItemPage> {
  //页面创建时初始化函数
  @override
  void initState() {
    super.initState();
    print("页面创建${widget.pageIndex}");
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("当前页面标识为${widget.pageIndex}"),
    );
  }

  //页面销毁时回调函数
  @override
  void dispose() {
    super.dispose();
    print("页面消失${widget.pageIndex}");
  }
}


class ScffoldHomeItemPage1 extends StatefulWidget {
  //页面标识
  int pageIndex;
  //构造函数
  ScffoldHomeItemPage1(this.pageIndex,{Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ScffoldHomeItemState1();
  }
}
class ScffoldHomeItemState1 extends State<ScffoldHomeItemPage1> {
  //页面创建时初始化函数
  @override
  void initState() {
    super.initState();
    print("页面创建${widget.pageIndex}");
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("当前页面标识为${widget.pageIndex}"),
    );
  }

  //页面销毁时回调函数
  @override
  void dispose() {
    super.dispose();
    print("页面消失${widget.pageIndex}");
  }
}


class ScffoldHomeItemPage2 extends StatefulWidget {
  //页面标识
  int pageIndex;
  //构造函数
  ScffoldHomeItemPage2(this.pageIndex,{Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ScffoldHomeItemState2();
  }
}
class ScffoldHomeItemState2 extends State<ScffoldHomeItemPage2> {
  //页面创建时初始化函数
  @override
  void initState() {
    super.initState();
    print("页面创建${widget.pageIndex}");
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("当前页面标识为${widget.pageIndex}"),
    );
  }

  //页面销毁时回调函数
  @override
  void dispose() {
    super.dispose();
    print("页面消失${widget.pageIndex}");
  }
}
