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



//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example214(),
  ));
}

///代码清单 2-26
///lib/code/code2/example_214_scaffold_page.dart
class Example214 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example214>
    with SingleTickerProviderStateMixin {

  ///子页面
  List<Widget> bodyWidgetList = [
    ScffoldHomeItemPage(0),
    ScffoldHomeItemPage(1),
    ScffoldHomeItemPage(2),
  ];

  List<Tab> tabWidgetlist = [
    Tab(
      text: "首页",
      icon: Icon(Icons.home),
    ),
    Tab(
      text: "消息",
      icon: Icon(Icons.message),
    ),
    Tab(
      text: "我的",
      icon: Icon(Icons.people),
    ),
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
        length: bodyWidgetList.length, vsync: this);
  }

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
    );
  }
  ///代码清单 2-27
  ///lib/code/code2/example_214_scaffold_page.dart
  //构建底部导航栏
  BottomAppBar buildBottomAppBar() {
    //创建一个 BottomNavigationBar
    return BottomAppBar(
      child: Theme(
        data: ThemeData(
          //点击的高亮颜色
          highlightColor: Colors.grey[400],
          //水波纹颜色
          splashColor: Colors.grey,
        ),
        //用来配置 TabBar 的背景颜色
        child: Material(
          color: Colors.grey[300],
          child: TabBar(
            //选中的 Tab 图标与文字的颜色
            labelColor: Colors.blue,
            //其他未选中的Tab 图标与文字的颜色
            unselectedLabelColor: Colors.blueGrey,
            //所有的Tab
            tabs: tabWidgetlist,
            //联动控制器
            controller: _tabController,
            //下划线的颜色
            indicatorColor: Colors.grey[300],
            //下划线的高度
            indicatorWeight: 1.0,
          ),
        ),
      ),
    );
  }
}

///代码清单 2-35
///lib/code/code2/example_214_scaffold_page.dart
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
