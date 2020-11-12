import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterdragscalewidget/flutterdragscalewidget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021503098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example503(),
  ));
}

///代码清单 5-7 NestedScrollView 的基本使用
///lib/code/code5/example_503_NestedScrollView.dart
class Example503 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example503>
    with SingleTickerProviderStateMixin {
  //因为页面主体使用到了TabBar 所以用到了控制器
  TabController tabController;

  @override
  void initState() {
    super.initState();
    //初始化控制器
    tabController = new TabController(
        //参数一 TabBar中Tab的个数
        //参数二 动画控制关联
        length: 3,
        vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NestedScrollView"),
      ),
      body: NestedScrollView(
        //配置可折叠的头布局
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [buildSliverAppBar()];
        },
        //超出显示内容区域的Widget
        //可以是一个TabBarView来结合TabBar使用
        body: buildBodyWidget(),
      ),
    );
  } //Sl

  ///代码清单 5-10 TabBarView 多页面切换
  ///lib/code/code5/example_503_NestedScrollView.dart
  buildBodyWidget2() {
    return TabBarView(
      controller: tabController,
      children: [
        ItemPage(),
        ItemPage(),
        ItemPage(),
      ],
    );
  } // iverAppBar的基本使用

  ///代码清单 5-9 ListView 一个列表
  ///lib/code/code5/example_503_NestedScrollView.dart
  buildBodyWidget() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.grey[200],
          height: 100,
          child: Container(
            margin: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
            padding: EdgeInsets.all(8),
            color: Colors.white,
            child: Text("测试数据"),
          ),
        );
      },
      //列表条目的个数
      itemCount: 200,
    );
  }

  ///代码清单 5-8 SliverAppBar 的详细配置
  ///lib/code/code5/example_503_NestedScrollView.dart
  buildSliverAppBar() {
    return SliverAppBar(
      title: Text("这里是标题"),
      //标题居中
      centerTitle: true,
      //当此值为true时 SliverAppBar title 会固定在页面顶部
      //当此值为fase时 SliverAppBar title 会随着滑动向上滑动
      pinned: true,

      //当pinned属性值为true时才会起作用
      //floating 为true时滑动到顶部 title会隐藏
      //         为false时 title 不会隐藏
      floating: false,

      //当snap配置为true时，向下滑动页面，SliverAppBar（
      // 以及其中配置的flexibleSpace内容）会立即显示出来，

      //反之当snap配置为false时，向下滑动时，
      // 只有当ListView的数据滑动到顶部时，SliverAppBar才会下拉显示出来。
      snap: false,
      //展开的高度
      expandedHeight: 200,
      //AppBar下的内容区域
      flexibleSpace: FlexibleSpaceBar(
        //背景
        //在这里直接使用的是一个图片
        background: Image.asset(
          "assets/images/2.0x/banner4.webp",
          height: 200,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      ),
      bottom: TabBar(
        controller: tabController,
        tabs: <Widget>[
          new Tab(
            text: "标签一",
          ),
          new Tab(
            text: "标签二",
          ),
          new Tab(
            text: "标签三",
          ),
        ],
      ),
    );
  }
}

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.grey[200],
          height: 100,
          child: Container(
            margin: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
            padding: EdgeInsets.all(8),
            color: Colors.white,
            child: Text("测试数据"),
          ),
        );
      },
      //列表条目的个数
      itemCount: 200,
    );
  }
}
