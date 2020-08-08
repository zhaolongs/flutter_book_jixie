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
  BottomNavigationBar buildBottomNavigation(){
    //创建一个 BottomNavigationBar
    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: normalIcon[0], title: Text(normalTitle[0])),
        new BottomNavigationBarItem(
            icon:  normalIcon[1], title: Text(normalTitle[1])),
        new BottomNavigationBarItem(
            icon:  normalIcon[2], title: Text(normalTitle[2])),
      ],
      //显示效果
      type: BottomNavigationBarType.fixed,
      //当前选中的页面
      currentIndex: _tabIndex,
      //导航栏的背景颜色
      backgroundColor: Colors.white,
      //选中时图标与文字的颜色
//      fixedColor: Colors.deepPurple,
      //选中时图标与文字的颜色
      selectedItemColor: Colors.blue,
      //未选中时图标与文字的颜色
      unselectedItemColor: Colors.grey,
      //图标的大小
      iconSize: 24.0,
      //点击事件
      onTap: (index) {
        setState(() {
          _tabIndex = index;
        });
      },
    );
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
