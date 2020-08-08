import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/demo/search_textfield_bar.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1507.dart
class NestScrollBaseUsePage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

///lib/code15/main_data1507.dart
class ScrollHomePageState extends State {
  ///SliverAppBar中配置的flexibleSpace展开的高度
  double expandedHeight = 200.0;

  ///NestedScrollView的滚动控制器
  ScrollController scrollController = new ScrollController();

  ///透明组件的透明度比率
  ///0.0 -1.0
  double slidRate = 0.0;
  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      ///获取滚动距离
      double offset = scrollController.offset;

      ///在这里配置的可折叠的高度为200;
      ///AppBar的高度为[kToolbarHeight] 56.0
      double toobarHeight = kToolbarHeight;

      ///当滑动的距离 offset 大于 [flagHeight]
      ///这个值时，代表折叠的内容区已开始隐藏
      double flagHeight = 200 - toobarHeight * 2;
      if (offset > flagHeight) {
        ///计算透明度
        slidRate = (offset - flagHeight) / toobarHeight;

        print("滑动的距离 $offset slidRatio $slidRate");
        if (slidRate > 1) {
          slidRate = 1.0;
        }

        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///页面主体内容
      body: buildSingleScrollView(),
    );
  }

  ///SingleChildScrollView 的基本使用
  Widget buildSingleScrollView() {
    ///滑动视图
    return NestedScrollView(
      controller: scrollController,

      ///超出显示内容区域的Widget
      body: buidChildWidget(),

      ///配置可折叠的头布局
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [buildSliverAppBar2()];
      },
    );
  }

  ///SliverAppBar的基本使用
  buildSliverAppBar() {
    return SliverAppBar(
      floating: false,
      snap: false,

      ///当此值为true时 SliverAppBar 会固定在页面顶部
      ///当此值为fase时 SliverAppBar 会随着滑动向上滑动
      pinned: false,

      title: Text("标题"),
    );
  }

  ///lib/code15/main_data1507.dart
  ///SliverAppBar的基本使用
  ///flexibleSpace可折叠的内容区域
  buildSliverAppBar2() {
    return SliverAppBar(
      title: buildHeader(),

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

  ///页面的主体内容
  Widget buidChildWidget() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("测试数据$index"),
        );
      },
      itemCount: 100,
    );
  }


  ///lib/code15/main_data1507.dart
  ///搜索框 SearchBar的宽度
  double searchBarWidth = 0.0;
  ///构建SliverAppBar的标题title
  ///左侧显示的返回键的 widget 取值 为 [kToolbarHeight]
  ///                也就是 56.0
  buildHeader() {
    ///计算搜索框的宽度
    calculateSearchBarWidth();
    ///透明组件
    return Container(
      alignment: Alignment.centerRight,
      child: Opacity(
        ///透明度
        opacity: slidRate,
        ///实现搜索框的平移
        child: Transform(
          ///在x轴方向从右向左平移
          transform: Matrix4.translationValues(
              searchBarWidth/2 * (1 - slidRate), 0, 0),
          child: SearchTextFieldBar(
              ///动态改变宽度
              width: searchBarWidth/2 + searchBarWidth/2 * slidRate,
              ///搜索框的高度
              height: 28,
              ///搜索框中文字的大小
              searchIconSize: 14,
              ///搜索框中文字的大小
              fontSize: 12,
              margin: EdgeInsets.zero,
              ///搜索框上显示的文本
              hint: "请输入内容搜索",
              clearCallback: () {},
              ///点击键盘上的搜索按钮的回调事件
              onSubmitted: (text) {},
              ///显示搜索框左侧的返回键按钮
              isShowBackButton: false),
        ),
      ),
    );
  }

  ///计算搜索框在SliverAppBar中的宽度
  void calculateSearchBarWidth() {
    ///为节省性能 只计算一次
    if(searchBarWidth==0){
      searchBarWidth =MediaQuery.of(context).size.width - kToolbarHeight*2;
    }
  }
}
