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

///lib/code15/main_data1523.dart
///常见滑动布局的实现 CustomScrollView + SliverGrid + SliverList
class ScrollBaseUsePage14 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  ///ScrollView使用的控制器
  ScrollController singleScrollController = new ScrollController();
  ///折叠头部展开的高度
  double expandedHeight  =200;

  ///标题的透明度
  double opacity =0.0;

  @override
  void initState() {
    super.initState();

    ///添加滑动监听
   singleScrollController.addListener(() {
     ///获取滑动的距离
     double scrollOffset = singleScrollController.offset;
     ///计算透明度 当向上滑动时
     ///SliverAppBar的flexibleSpace部分开始慢慢折叠
     ///然后此时 scrollOffset 逐渐增大 比值 flag 还小于1.0
     ///然后 页面显示的标题 透明度由 0.0 开始逐渐增大直到 1.0
     double flag  = scrollOffset/expandedHeight;
     ///多几步判断 只是为了优化性能 避免重复的去刷新页面
     ///当flag大于1.0时 SliverAppBar的flexibleSpace部分已经完全折叠
     ///当 opacity等于1.0时
     ///    说明标题已完全显示出来了然后再滑动就不需要刷新页面了
     if(flag>1.0&&opacity!=1.0){
       opacity=1.0;
       setState(() {});
       print(" 等于 1.0 刷新 ");
     }else if(flag<1.0&&flag>=0.0){
       opacity=flag;
       setState(() {});
       print(" 小于 1.0 刷新 ");
     }
     print(" opacity $opacity");
   });
  }
  ///lib/code15/main_data1523.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      ///下拉刷新组件
      body: RefreshIndicator(
        ///下拉刷新回调方法
        onRefresh: () async {
          ///模拟网络刷新 等待2秒
          await Future.delayed(Duration(milliseconds: 2000));
          ///返回值以结束刷新
          return Future.value(true);
        },
        ///页面的主体内容
        ///是一个 CustomScrollView
        child: CustomScrollView(
          ///滑动控制器配制
          controller: singleScrollController,
          ///设置滑动无回弹效果
          physics: ClampingScrollPhysics(),
          ///使用线性布局组合
          slivers: [
            ///固定的布局 SliverAppBar
            buildSliverAppBar(),
            ///九宫格布局 SliverGrid
            buildSliverGrid(),
            ///列表布局 SliverList
            buildSliverList(),
          ],
        ),
      ),
    );
  }


  ///lib/code15/main_data1523.dart
  ///SliverAppBar 可折叠的标题栏
  ///flexibleSpace可折叠的内容区域
  buildSliverAppBar() {
    return SliverAppBar(
      ///构建中间显示的标题
      title: buildSliverTitleWidget(),
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
      expandedHeight: expandedHeight,
      ///AppBar下的内容区域
      flexibleSpace: FlexibleSpaceBar(
        ///背景
        ///配置的是一个widget也就是说在这里可以使用任意的
        ///Widget组合 在这里直接使用的是一个图片
        background: Image.asset(
          "assets/images/2.0x/banner3.webp",
          height: expandedHeight,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  ///lib/code15/main_data1523.dart
  ///构建中间显示的标题
  Widget buildSliverTitleWidget(){
    //透明组件 默认opacity为0 完全透明 表现为页面上不显示
    ///随着向上滑动 opacity 逐渐由 0.0 过渡到 1.0 标题逐渐显示出来

    return Opacity(opacity:opacity,child: Text("内容详情"),);
  }

  ///lib/code15/main_data1523.dart
  ///CustomScrollView 中使用九宫格布局
  ///九宫格 通过构造函数来创建
  SliverPadding buildSliverGrid() {
   ///结合 SliverPadding 设置一个内边距
    return SliverPadding(
       padding: EdgeInsets.all(10),
      sliver: new SliverGrid(
        ///使用构建方法来构建
        ///用来配置每个子Item之间的关系
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          ///主方向每个Item之间的间隔
          mainAxisSpacing: 10.0,
          ///次方向每个Item之间的间隔
          crossAxisSpacing: 10.0,
          ///Item的宽与高的比例
          childAspectRatio: 1.0,
          ///每行的Item个数
          crossAxisCount: 4,
        ),
        ///用来配置每个子Item的具体构建
        delegate: new SliverChildListDelegate(buildGridItemList()),
      ),
    );
  }
  ///GridView的子条目构建
  List<Widget> buildGridItemList() {
    List<Widget> list = [];
    for (var i = 0; i < 8; i++) {
      list.add(
        ///裁剪成微圆角矩形样式
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(6),
            child: Image.asset(
              "assets/images/2.0x/banner1.webp",
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
    }
    return list;
  }
  ///lib/code15/main_data1523.dart
  ///SliverList 列表
  /// 通过构造方法方法来创建
  Widget buildSliverList() {
    return SliverList(
      delegate: new SliverChildBuilderDelegate(
        ///构建每个Item的具体显示UI
            (BuildContext context, int index) {
          //创建子widget
          return new Container(
            height: 44,
            alignment: Alignment.center,
            ///根据角标来动态计算生成不同的背景颜色
            color: Colors.cyan[100 * ((index+1) % 9)],
            child: new Text('grid item $index'),
          );
        },
        ///列表的条目个数
        childCount: 100,
      ),
    );
  }

}
