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

///lib/code15/main_data1701.dart
///GridView的基本使用
class GridViewBaseUsePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("GridView基本使用"),
      ),

      ///构建列表数据
//      body: buildGridView1(),
//      body: buildGridView2(),
//      body: buildGridView3(),
//      body: buildGridView4(),
      body: buildGridView5(),
    );
  }


  ///lib/code15/main_data1701.dart
  ///GridView 的基本使用
  ///通过构造函数来创建
  Widget buildGridView1() {
    return GridView(
      ///子Item排列规则
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
          crossAxisCount: 3,
          //纵轴间距
          mainAxisSpacing: 10.0,
          //横轴间距
          crossAxisSpacing: 10.0,
          //子组件宽高长度比例
          childAspectRatio: 1.4),
      ///GridView中使用的子Widegt
      children: buildListViewItemList(),
    );
  }

  ///lib/code15/main_data1701.dart
  ///GridView 的基本使用
  ///通过构造函数来创建
  Widget buildGridView2() {
    double width = MediaQuery.of(context).size.width;
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    print(" width $width  devicePixelRatio $devicePixelRatio");
    return GridView(
      ///子Item排列规则
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        ///子Item的最大宽度
        maxCrossAxisExtent: 100,
        //纵轴间距
        mainAxisSpacing: 10.0,
        //横轴间距
        crossAxisSpacing: 10.0,
        //子组件宽高长度比例
        childAspectRatio: 1.4,
      ),
      ///GridView中使用的子Widegt
      children: buildListViewItemList(),
    );
  }


  ///lib/code15/main_data1701.dart
  ///GridView 的基本使用
  ///通过count方式来创建
  Widget buildGridView3() {
    return GridView.count(
      ///每行的列数
      crossAxisCount: 4,
      //纵轴间距
      mainAxisSpacing: 10.0,
      //横轴间距
      crossAxisSpacing: 10.0,
      ///所有的子条目
      children: buildListViewItemList(),
    );
  }

  ///lib/code15/main_data1701.dart
  ///GridView 的基本使用
  ///通过count方式来创建
  Widget buildGridView4() {
    return GridView.extent(
      ///每列Item的最大宽度
      maxCrossAxisExtent: 120,
      //纵轴间距
      mainAxisSpacing: 10.0,
      //横轴间距
      crossAxisSpacing: 10.0,
      ///所有的子条目
      children: buildListViewItemList(),
    );
  }
  ///lib/code15/main_data1701.dart
  ///GridView 的基本使用
  ///通过builder方式来创建
  Widget buildGridView5() {
    return GridView.builder(
      ///缓存区域
      cacheExtent: 120,
      ///内边距
      padding: EdgeInsets.all(8),
      ///条目个数
      itemCount: 100,
      ///子Item排列规则
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        ///子Item的最大宽度
        maxCrossAxisExtent: 100,
        //纵轴间距
        mainAxisSpacing: 10.0,
        //横轴间距
        crossAxisSpacing: 10.0,
        //子组件宽高长度比例
        childAspectRatio: 1.4,
      ),
      ///懒加载构建子条目
      itemBuilder: (BuildContext context,int index){
        return buildListViewItemWidget(index);
      },
    );
  }

  ///lib/code15/main_data1701.dart
  ///GridView 的基本使用
  ///通过custom方式来创建
  Widget buildGridView() {
    return GridView.custom(
      cacheExtent: 200,
        ///子Item排列规则
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          ///子Item的最大宽度
          maxCrossAxisExtent: 100,
          //纵轴间距
          mainAxisSpacing: 10.0,
          //横轴间距
          crossAxisSpacing: 10.0,
          //子组件宽高长度比例
          childAspectRatio: 1.4,
        ),
        ///子条目的构建模式
        childrenDelegate:
            ///懒加载的模式
            SliverChildBuilderDelegate((BuildContext context, int index) {
          return buildListViewItemWidget(index);
        }));
  }

  ///lib/code15/main_data1701.dart
  List<Widget> buildListViewItemList(){
    List<Widget> list = [];
    ///模拟的8条数据
    for (int i = 0; i < 8; i++) {
      list.add(buildListViewItemWidget(i));
    }
    return list;
  }

  ///创建GridView使用的子布局
  Widget buildListViewItemWidget(int index) {
    return new Container(
      ///内容剧中
      alignment: Alignment.center,

      ///根据角标来动态计算生成不同的背景颜色
      color: Colors.cyan[100 * (index % 9)],
      child: new Text('grid item $index'),
    );
  }
}
