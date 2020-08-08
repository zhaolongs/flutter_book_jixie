import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1509.dart
class NestScrollBaseUsePage4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

///lib/code15/main_data1509.dart
class ScrollHomePageState extends State with SingleTickerProviderStateMixin {


  ///因为页面主体使用到了TabBar 所以用到了控制器
  TabController tabController;

  @override
  void initState() {
    super.initState();
    ///初始化控制器
    tabController = new TabController(
       ///参数一 TabBar中Tab的个数
      ///参数二 动画控制关联
        length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ///构建页面的主体
    return Scaffold(body: buildNestedScrollView());
  }
  ///NestedScrollView 的基本使用
  Widget buildNestedScrollView() {
    ///滑动视图
    return NestedScrollView(
      ///配置可折叠的头布局
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [buildSliverAppBar2()];
      },
      ///页面的主体内容
      body: buidChildWidget(),
    );
  }

  ///SliverAppBar的基本使用
  ///flexibleSpace可折叠的内容区域
  buildSliverAppBar2() {
    return SliverAppBar(
      title: Text("这里是标题"),
      ///标题居中
      centerTitle: true,
      ///当此值为true时 SliverAppBar 会固定在页面顶部
      ///当此值为fase时 SliverAppBar 会随着滑动向上滑动
      pinned: true,
      ///当值为true时 SliverAppBar设置的title会随着上滑动隐藏
      ///然后配置的bottom会显示在原AppBar的位置
      ///当值为false时 SliverAppBar设置的title会不会隐藏
      ///然后配置的bottom会显示在原AppBar设置的title下面
      floating: false,
      ///当snap配置为true时，向下滑动页面，SliverAppBar（以及其中配置的flexibleSpace内容）会立即显示出来，
      ///反之当snap配置为false时，向下滑动时，只有当ListView的数据滑动到顶部时，SliverAppBar才会下拉显示出来。
      snap: false,
      ///展开的高度
      expandedHeight: 200,
      ///AppBar下的内容区域
      flexibleSpace: FlexibleSpaceBar(
        ///背景
        ///在这里直接使用的是一个图片
        background: Image.asset(
          "assets/images/2.0x/banner3.webp",
          height: 200,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      ),
      bottom:TabBar(
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

  ///页面的主体内容
  Widget buidChildWidget() {
    return   ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("页面 测试数据$index"),
        );
      },
      itemCount: 100,
    );
  }
}
