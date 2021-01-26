
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/9/25.
//
// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/9/25.
//
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
//
//

void main() {
  //启动根目录
  runApp(MaterialApp(
    home: Example631(),
  ));
}

///代码清单 6-46 [GridView] 的加载动画
///lib/code/code6/example_631_AnimationLimiter.dart
class Example631 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("GridView加载动画"),
      ),
      //动画监听
      body: AnimationLimiter(
        //列表组件
        child: buildListView(),
      ),
    );
  }

  //GridView 的构建
  GridView buildListView() {
    //懒加载的方式
    return GridView.builder(
      itemCount: 100,
      cacheExtent: 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
          crossAxisCount: 4,
          //纵轴间距
          mainAxisSpacing: 10.0,
          //横轴间距
          crossAxisSpacing: 10.0,
          //子组件宽高长度比例
          childAspectRatio: 1.0),
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredGrid(
          columnCount: 100,
          position: index,
          duration: const Duration(milliseconds: 375),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: Container(
                color: Colors.lightGreenAccent,
              ),
            ),
          ),
        );
      },
    );
  }
}
