import 'dart:async';

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
    home: Example512(),
  ));
}
///代码清单 5-49 GridView 下拉刷新
///lib/code/code5/example_512_GridView_RefreshIndicator.dart
class Example512 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example512> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("GridView RefreshIndicator"),
      ),
      body: RefreshIndicator(
          //圆圈进度颜色
          color: Colors.blue,
          //下拉停止的距离
          displacement: 44.0,
          //背景颜色
          backgroundColor: Colors.grey[200],
          //下拉刷新的回调
          onRefresh: () async {
            //模拟网络请求
            await Future.delayed(Duration(milliseconds: 2000));
            //结束刷新
            return Future.value(true);
          },
          child: buildGridView()),
    );
  }


  Widget buildGridView() {
    return GridView.builder(
      //缓存区域
      cacheExtent: 120,
      //内边距
      padding: EdgeInsets.all(8),
      //条目个数
      itemCount: 100,
      //子Item排列规则
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //子Item的最大宽度
        maxCrossAxisExtent: 100,
        //纵轴间距
        mainAxisSpacing: 10.0,
        //横轴间距
        crossAxisSpacing: 10.0,
        //子组件宽高长度比例
        childAspectRatio: 1.4,
      ),
      //懒加载构建子条目
      itemBuilder: (BuildContext context, int index) {
        return buildListViewItemWidget(index);
      },
    );
  }

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
}
