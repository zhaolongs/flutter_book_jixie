import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///

///代码清单 2-16
///lib/code/code2/example_scaffold_216_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'custom_tab.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example239(),
  ));
}

class Example239 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example239>
    with SingleTickerProviderStateMixin {
  ///子页面
  List<Widget> bodyWidgetList = [
    ScffoldHomeItemPage(0),
    ScffoldHomeItemPage(1),
    ScffoldHomeItemPage(2),
  ];

  //创建控制器
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    ///创建控制器
    _tabController = new TabController(
      //初始化显示的页面
        initialIndex: 0,
        //页面个数
        length: bodyWidgetList.length,
        vsync: this);
  }

  ///代码清单 2-40
  ///lib/code/code2/example_scaffold_239_page.dart
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //页面的头部
      appBar: AppBar(
        title: Text("底部菜单栏切换页面"),
      ),
      //页面的主内容区
      //可以是单独的StatefulWidget
      body: TabBarView(
        controller: _tabController,
        children: bodyWidgetList,
      ),
      //底部导航栏
      bottomNavigationBar: buildBottomAppBar(),
      //悬浮按钮的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //悬浮按钮
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print("add press ");
        },
      ),
    );
  }

  ///代码清单 2-41
  ///lib/code/code2/example_scaffold_239_page.dart
  //构建底部导航栏
  //BottomAppBar结合悬浮按钮使用
  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      //悬浮按钮 与其他菜单栏的结合方式
      shape: CircularNotchedRectangle(),
      // FloatingActionButton和BottomAppBar 之间的差距
      notchMargin: 6.0,
      //底部导航栏的背景
      color: Colors.white,
      //Row中的子Widget在水平方向不线性排列
      child: Container(
        height: 64,
        child: buildRow(),
      ),
    );
  }
  ///代码清单 2-42
  ///lib/code/code2/example_scaffold_239_page.dart
  Row buildRow() {
    return Row(
      //使用每一个子Widget平均分配Row的宽度
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomTab(
          clickCallBack: () {
            _tabController.index = 0;
            setState(() {});
          },
          text: "首页",
          iconData: Icons.home,
          isSelect: _tabController.index == 0,
        ),
        CustomTab(
          clickCallBack: () {
            _tabController.index = 1;
            setState(() {});
          },
          text: "消息",
          isSelect: _tabController.index == 1,
        ),
        CustomTab(
          clickCallBack: () {
            _tabController.index = 2;
            setState(() {});
          },
          text: "我的",
          iconData: Icons.people,
          isSelect: _tabController.index == 2,
        ),
      ],
    );
  }
}

class ScffoldHomeItemPage extends StatefulWidget {
  //页面标识
  final int pageIndex;

  //构造函数
  ScffoldHomeItemPage(this.pageIndex, {Key key}) : super(key: key);

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
    return Center(
      child: Text("当前页面标识为${widget.pageIndex}"),
    );
  }

  //页面销毁时回调函数
  @override
  void dispose() {
    super.dispose();
    print("页面消失${widget.pageIndex}");
  }
}
