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

///lib/code15/main_data1515.dart
///
class CustomScrollBaseUsePage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ///构建页面的主体
    return Scaffold(
      body: buildCustomScrollView(),
    );
  }

  ///lib/code15/main_data1515.dart
  ///CustomScrollView的基本使用
  ScrollController scrollController =new ScrollController();
  ///构建一个CustomScrollView
  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(
      ///滚动方向配置
      ///这里配置的竖直方向滚动
      scrollDirection: Axis.vertical,
      ///为true时滚动到底部
      reverse: false,
      ///滑动控制器
      controller: scrollController,
      ///不使用Widgets树中默认的DefaultPrimaryController
      primary:false,
      ///滚动到边界时的回弹效果
      physics:BouncingScrollPhysics(),
      ///当scrollOffset = 0，第一个child在viewport的位置（0 <= anchor <= 1.0），
      ///0.0在leading，1.0在trailing，0.5在中间
      anchor: 0.0,
      ///缓存区域大小
      cacheExtent:1000,
      ///内容区域，主要为Sliver系列的组件
      slivers: <Widget>[
        //SliverAppBar导航栏
        buildSliverAppBar(),
        buildSliverGrid2(),
//        buildSliverList(),
        buildSliverList2(),
      ],
    );
  }

  ///lib/code15/main_data1515.dart
  ///CustomScrollView 中使用九宫格布局
  ///九宫格 通过构造函数来创建
  SliverGrid buildSliverGrid1() {
    ///使用构建方法来构建
    return new SliverGrid(
      ///用来配置每个子Item之间的关系
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        //Grid按2列显示，也就是列数
        crossAxisCount: 2,
        ///主方向每个Item之间的间隔
        mainAxisSpacing: 10.0,
        ///次方向每个Item之间的间隔
        crossAxisSpacing: 10.0,
        ///Item的宽与高的比例
        childAspectRatio: 3.0,
      ),

      ///用来配置每个子Item的具体构建
      delegate: new SliverChildBuilderDelegate(
        ///构建每个Item的具体显示UI
        (BuildContext context, int index) {
          //创建子widget
          return new Container(
            alignment: Alignment.center,
            ///根据角标来动态计算生成不同的背景颜色
            color: Colors.cyan[100 * (index % 9)],
            child: new Text('grid item $index'),
          );
        },

        ///Grid的个数
        childCount: 20,
      ),
    );
  }
  ///lib/code15/main_data1515.dart
  ///CustomScrollView 中使用九宫格布局
  ///九宫格 通过构造函数来创建
  SliverGrid buildSliverGrid2() {
    ///使用构建方法来构建
    return new SliverGrid(
      ///用来配置每个子Item之间的关系
      gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
        ///主方向每个Item之间的间隔
        mainAxisSpacing: 10.0,
        ///次方向每个Item之间的间隔
        crossAxisSpacing: 10.0,
        ///Item的宽与高的比例
        childAspectRatio: 3.0,
        ///每个Item的最大宽度
        maxCrossAxisExtent: 200,
      ),

      ///用来配置每个子Item的具体构建
      delegate: new SliverChildListDelegate(buildSliverGridItemList()),
    );
  }

  ///lib/code15/main_data1515.dart
  ///CustomScrollView 中使用九宫格布局
  ///九宫格 通过count方法来创建
  SliverGrid buildSliverGrid() {
    return SliverGrid.count(
      ///一行展示4列
      crossAxisCount: 4,
      ///主方向每个Item之间的间隔
      mainAxisSpacing: 10.0,
      ///次方向每个Item之间的间隔
      crossAxisSpacing: 10.0,
      ///Item的宽与高的比例
      childAspectRatio: 2.0,
      ///构建显示子
      children: [
        ...buildSliverGridItemList(),
      ],
    );
  }

  ///lib/code15/main_data1515.dart
  ///CustomScrollView 中使用九宫格布局
  ///九宫格 通过count方法来创建
  SliverGrid buildSliverGrid3() {
    return SliverGrid.extent(
      ///每个Item展示的最大宽度
      maxCrossAxisExtent: 200,
      ///主方向每个Item之间的间隔
      mainAxisSpacing: 10.0,
      ///次方向每个Item之间的间隔
      crossAxisSpacing: 10.0,
      ///Item的宽与高的比例
      childAspectRatio: 2.0,
      ///构建显示子
      children: [
        ...buildSliverGridItemList(),
      ],
    );
  }


  ///lib/code15/main_data1515.dart
  ///构建九宫格布局中使用到的Item
  List<Widget> buildSliverGridItemList(){
    List<Widget> itemWidgetList = [];
    ///模拟8条数据
    for (var i = 0; i < 8; i++) {
      itemWidgetList.add(
        new Container(
          alignment: Alignment.center,
          ///根据角标来动态计算生成不同的背景颜色
          color: Colors.cyan[100 * (i % 9)],
          child: new Text('grid item $i'),
        ),
      );
    }
    return itemWidgetList;
  }

  Widget buildSliverFixedExtentList() {
    return new SliverFixedExtentList(
      itemExtent: 50.0,
      delegate:
          new SliverChildBuilderDelegate((BuildContext context, int index) {
        //创建列表项
        return new Container(
          alignment: Alignment.center,
          color: Colors.lightBlue[100 * (index % 9)],
          child: new Text('list item $index'),
        );
      }, childCount: 50 //50个列表项
              ),
    );
  }

  ///lib/code15/main_data1515.dart
  ///SliverAppBar
  ///flexibleSpace可折叠的内容区域
  buildSliverAppBar() {
    return SliverAppBar(
      title: Text("标题"),
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
      expandedHeight: 260,

      ///AppBar下的内容区域
      flexibleSpace: FlexibleSpaceBar(
        ///背景
        ///配置的是一个widget也就是说在这里可以使用任意的
        ///Widget组合 在这里直接使用的是一个图片
        background: buildFlexibleSpaceWidget(),
      ),
    );
  }

  ///lib/code15/main_data1515.dart
  ///显示图片与角标区域Widget构建
  buildFlexibleSpaceWidget() {
    return Container(
      ///层叠布局
      child: Stack(
        children: [
          ///用于显示图片的PageView
          buildImagePage(),

          ///角标显示
          buildCornerMark(),
        ],
      ),
    );
  }

  ///lib/code15/main_data1515.dart
  ///图片数据
  List<String> imagePathList = [
    "assets/images/2.0x/banner3.webp",
    "assets/images/2.0x/banner2.webp",
    "assets/images/2.0x/banner1.webp",
    "assets/images/2.0x/banner4.webp",
  ];

  ///当前显示图片的角标
  int currentShowImageIndex = 0;

  ///构建用来显示多张图片的PageView
  ///支持左右滚动
  Widget buildImagePage() {
    return Container(
      child: PageView.builder(

          ///页面滚动后的回调
          ///参数 [pageIndex] 为当前页面的角标
          onPageChanged: (int pageIndex) {
            setState(() {
              currentShowImageIndex = pageIndex;
            });
          },

          ///滚动到边界时的回弹效果
          physics: BouncingScrollPhysics(),

          ///图片个数
          itemCount: imagePathList.length,

          ///构建每个条目的显示
          itemBuilder: (BuildContext context, int index) {
            return buildFlexibleSpaceItemWidget(index);
          }),
    );
  }

  ///构建显示图片的Widget
  ///参数[index]为当前显示PageView的角标 从0开始
  Widget buildFlexibleSpaceItemWidget(int index) {
    ///这里是加载使用的本地资源目录assets下的文件
    ///实际项目开发中一般使用的网络图片
    ///只需要替换这里使用网络方式加载即可
    return Image.asset(
      imagePathList[index],

      ///图片的高度
      height: MediaQuery.of(context).size.width,

      ///显示图片的宽度，这里取用的是屏幕的宽度
      width: 260,

      ///图片填充
      fit: BoxFit.fill,
    );
  }

  ///lib/code15/main_data1515.dart
  ///角标显示
  ///用来显示滚动图片的位置
  Widget buildCornerMark() {
    ///在层叠布局Stack中通过Positioned来定位子Widget
    ///这里是右下角对齐
    return Positioned(
      bottom: 12,
      right: 12,

      ///通过Container来实现一个半透明的体育场的背景
      child: Container(
        ///内边距的设置
        padding: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),

        ///边框的装饰
        decoration: BoxDecoration(

            ///半透明背景设置
            color: Color(0x50999999),

            ///圆角矩形的裁剪
            borderRadius: BorderRadius.all(Radius.circular(15))),

        ///显示角标的文本
        child: Text(
          "${currentShowImageIndex + 1}/${imagePathList.length}",
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }

  ///lib/code15/main_data1515.dart
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
            color: Colors.cyan[100 * (index % 9)],
            child: new Text('grid item $index'),
          );
        },
        ///列表的条目个数
        childCount: 100,
      ),
    );
  }

  ///lib/code15/main_data1515.dart
  /// SliverFixedExtentList 列表
  /// 通过构造方法方法来创建
  Widget buildSliverList2() {

    return SliverFixedExtentList (
      ///子条目的高度
      itemExtent: 66,
      ///构建代理
      delegate: new SliverChildBuilderDelegate(
        ///构建每个Item的具体显示UI
            (BuildContext context, int index) {
          //创建子widget
          return new Container(
            height: 44,
            alignment: Alignment.center,
            ///根据角标来动态计算生成不同的背景颜色
            color: Colors.cyan[100 * (index % 9)],
            child: new Text('grid item $index'),
          );
        },
        ///列表的条目个数
        childCount: 100,
      ),
    );
  }

}
