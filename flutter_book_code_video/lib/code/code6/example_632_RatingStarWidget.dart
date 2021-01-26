
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/base/rating_star_widget.dart';

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
    home: Example632(),
  ));
}

///代码清单 6-47 [RatingStarWidget] 评分五角星
///lib/code/code6/example_632_RatingStarWidget.dart
class Example632 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("评分五角星"),
      ),
      //动画监听
      body: Container(
        margin: EdgeInsets.all(12),
        child: RatingStarWidget(
          //评分回调的数据类型
          starType: StarType.iStar,
          //选中的五角星的高亮颜色
          selectColor: Colors.deepOrange[400],
          //背景显示的五角星的颜色
          normalColor: Colors.grey[400],
          //评分五角星的间隔
          space: 6,
          //是否可滑动或者是点击修改评分值
          isAnimation: true,
          //五角星个数
          totalNumber: 6,
          //高亮显示的五角星的个数
          initNumber: 4,
          //初始化选择五角星的加载动画  默认无动画
          starAnimationType: StarAnimationType.fade,
          //五角星的加载动画的时间 默认 800毫秒
          animationMills: 1000,
          //滑动或者点击评分修改后的回调
          selectCallback: (value) {
            print("选择的评分  $value");
          },
        ),
      ),
    );
  }
}
