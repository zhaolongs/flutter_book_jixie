import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example505(),
  ));
}

class Example505 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example505> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomScrollView"),
      ),
      body: CustomScrollView(
        //滑动控制器
        controller: _scrollController,
        slivers: [buildSliverGrid()],
      ),
    );
  }

  ///代码清单 5-12 九宫格 通过构造函数来创建
  ///lib/code/code5/example_504_CustomScrollView.dart
  SliverGrid buildSliverGrid() {
    //使用构建方法来构建
    return new SliverGrid(
      //用来配置每个子Item之间的关系
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        //Grid按2列显示，也就是列数
        crossAxisCount: 2,
        //主方向每个Item之间的间隔
        mainAxisSpacing: 10.0,
        //次方向每个Item之间的间隔
        crossAxisSpacing: 10.0,
        //Item的宽与高的比例
        childAspectRatio: 3.0,
      ),

      //用来配置每个子Item的具体构建
      delegate: new SliverChildBuilderDelegate(
        //构建每个Item的具体显示UI
        (BuildContext context, int index) {
          //创建子widget
          return new Container(
            alignment: Alignment.center,
            //根据角标来动态计算生成不同的背景颜色
            color: Colors.cyan[100 * (index % 9)],
            child: new Text('grid item $index'),
          );
        }, //Grid的个数
        childCount: 20,
      ),
    );
  }

  ///代码清单 5-13 九宫格 通过构造函数来创建
  ///lib/code/code5/example_504_CustomScrollView.dart
  SliverGrid buildSliverGrid2() {
    //使用构建方法来构建
    return new SliverGrid(
      //用来配置每个子Item之间的关系
      gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
        //主方向每个Item之间的间隔
        mainAxisSpacing: 10.0,
        //次方向每个Item之间的间隔
        crossAxisSpacing: 10.0,
        //Item的宽与高的比例
        childAspectRatio: 3.0,
        //每个Item的最大宽度
        maxCrossAxisExtent: 200,
      ),
      delegate: SliverChildListDelegate([
        Container(
          color: Colors.redAccent,
          child: new Text('grid item'),
        ),
        Container(
          color: Colors.black,
          child: new Text('grid item'),
        )
      ]),
    );
  }

  ///代码清单 5-14 SliverList 列表
  ///lib/code/code5/example_504_CustomScrollView.dart
  Widget buildSliverList() {
    return SliverList(
      delegate: new SliverChildBuilderDelegate(
        //构建每个Item的具体显示UI
        (BuildContext context, int index) {
          //创建子widget
          return new Container(
            height: 44,
            alignment: Alignment.center,
            //根据角标来动态计算生成不同的背景颜色
            color: Colors.cyan[100 * (index % 9)],
            child: new Text('grid item $index'),
          );
        },
        //列表的条目个数
        childCount: 100,
      ),
    );
  }

  ///代码清单 5-15 SliverFixedExtentList 列表
  ///lib/code/code5/example_504_CustomScrollView.dart
  Widget buildSliverList2() {
    return SliverFixedExtentList(
      //子条目的高度
      itemExtent: 66,
      //构建代理
      delegate: new SliverChildBuilderDelegate(
        //构建每个Item的具体显示UI
        (BuildContext context, int index) {
          //创建子widget
          return new Container(
            height: 44,
            alignment: Alignment.center,
            //根据角标来动态计算生成不同的背景颜色
            color: Colors.cyan[100 * (index % 9)],
            child: new Text('grid item $index'),
          );
        },
        //列表的条目个数
        childCount: 100,
      ),
    );
  }

  ///代码清单 5-16 SliverToBoxAdapter
  ///lib/code/code5/example_504_CustomScrollView.dart
  Widget buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            child: Image.asset(
              "assets/images/2.0x/banner4.webp",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: 200,
            ),
          ),
        )
      ],
    );
  }

  ///代码清单 5-17 SliverToBoxAdapter
  ///lib/code/code5/example_504_CustomScrollView.dart
  Widget buildCustomScrollView7() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          //内边距
          padding: EdgeInsets.all(10.0),
          //Sliver子组件
          sliver: buildSliverList7(),
        )
      ],
    );
  }

  Widget buildSliverList7() {
    return SliverList(
      delegate: new SliverChildBuilderDelegate(
        //构建每个Item的具体显示UI
        (BuildContext context, int index) {
          //创建子widget
          return new Container(
            height: 44,
            alignment: Alignment.center,
            //根据角标来动态计算生成不同的背景颜色
            color: Colors.cyan[100 * (index % 9)],
            child: new Text('grid item $index'),
          );
        },
        //列表的条目个数
        childCount: 100,
      ),
    );
  }



}
