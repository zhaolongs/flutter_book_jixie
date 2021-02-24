
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
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.grey[200]),
    home: Example509(),
  ));
}


class Example509 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Example509State();
  }
}
///代码清单 5-21 ListView 的基本使用
///lib/code/code5/example_510_ListView.dart
class _Example509State extends State<Example509> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("ListView "),
      ),
      body: buildListView(),
    );
  }

  //通过构造函数来创建
  Widget buildListView() {
    return ListView(
      //可滚动widget公共参数
      //滚动方向
      //    Axis.vertical 竖直方向滚动
      //    Axis.horizontal 水平方向滚动
      scrollDirection: Axis.vertical,
      //设置为 true 时 列表数据是滚动到底部的
      //    默认为false，列表数据在开始位置
      reverse: false,
      //滚动到列表边界时的回弹效果
      physics: BouncingScrollPhysics(),
      //子Item
      children: [
        Text("测试数据1"),
        Text("测试数据2"),
        Text("测试数据3"),
        Text("测试数据4"),
      ],
    );
  }

  ///代码清单 5-22 ListView 通过builder来构建
  ///lib/code/code5/example_510_ListView.dart
  Widget buildListView1() {
    return ListView.builder(
      //列表子Item个数
      itemCount: 10000,
      //每个列表子Item的高度
      itemExtent: 100,
      //构建每个ListView的Item
      itemBuilder: (BuildContext context, int index) {
        //子Item可单独封装成一个StatefulWidget
        //也可以是一个 Widget
        return buildListViewItemWidget(index);
      },
    );
  }

  ///代码清单 5-23  创建ListView使用的子布局
  ///lib/code/code5/example_510_ListView.dart
  Widget buildListViewItemWidget(int index) {
    return new Container(
      //列表子Item的高度
      height: 84,
      //内容剧中
      alignment: Alignment.center,
      //根据索引来动态计算生成不同的背景颜色
      color: Colors.cyan[100 * (index % 9)],
      child: new Text('grid item $index'),
    );
  }

  ///代码清单 5-24  通过separated来构建
  ///lib/code/code5/example_510_ListView.dart
  Widget buildListView2() {
    return ListView.separated(
      //列表子Item个数
      itemCount: 10000,
      //构建每个ListView的Item
      itemBuilder: (BuildContext context, int index) {
        //ListView的子Item
        return buildListViewItemWidget(index);
      },
      //构建每个子Item之间的间隔Widget
      separatorBuilder: (BuildContext context, int index) {
        //这里构建的时不同颜色的分隔线
        return new Container(
          height: 4,
          //根据索引来动态计算生成不同的背景颜色
          color: Colors.cyan[100 * (index % 9)],
        );
      },
    );
  }

  ///代码清单 5-25  通过custom来构建
  /// 与通过构造函数 代码清单 5-37 中的原理一致
  ///lib/code/code5/example_510_ListView.dart
  Widget buildListView3() {
    return ListView.custom(
      //一次性构建所有的列表子Item
      //适用于少量数据
      childrenDelegate: SliverChildListDelegate([
        Text("测试数据1"),
        Text("测试数据2"),
        Text("测试数据3"),
        Text("测试数据4"),
      ]),
    );
  }

  ///代码清单 5-26  适用于构建大量数据
  ///lib/code/code5/example_510_ListView.dart
  Widget buildListView4() {
    return ListView.custom(
      childrenDelegate:
          SliverChildBuilderDelegate((BuildContext context, int index) {
        return new Container(
          height: 40,
          //根据索引来动态计算生成不同的背景颜色
          color: Colors.cyan[100 * (index % 9)],
        );
      },
              //子Item的个数
              childCount: 20),
    );
  }
}
