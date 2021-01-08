import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/7.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///

///代码清单 13-2
///lib/src/page/custom_bottom_appbar.dart
///首页面底部菜单栏
class CustomBottomAppBar extends StatefulWidget {
  ///菜单点击回调
  final Function(int index) clickCallBack;

  ///小红点提示的索引
  final int tipsIndex;

  CustomBottomAppBar({this.clickCallBack, this.tipsIndex});

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  //当前显示页面的标签
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        buildBotomItem(_tabIndex, 0, Icons.home, "首页"),
        buildBotomItem(_tabIndex, 1, Icons.menu, "分类"),
        buildBotomItem(_tabIndex, -1, null, ""),
        buildBotomItem(_tabIndex, 2, Icons.email, "发现"),
        buildBotomItem(_tabIndex, 3, Icons.person, "我的"),
      ],
    );
  }

  ///代码清单 13-3
  ///lib/src/page/custom_bottom_appbar.dart
  /// _CustomBottomAppBarState 中方法定义 点击事件构建
  /// [selectIndex] 当前选中的页面
  /// [index]每个条目对应的角标
  /// [iconData] 每个条目对就的图标
  /// [title] 每个条目对应的标题
  buildBotomItem(int selectIndex, int index, IconData iconData, String title) {
    return Expanded(
      //权重适配 1：1 比例
      flex: 1,
      child: new GestureDetector(
        onTap: () {
          if (index != _tabIndex) {
            //更新当前显示
            setState(() {
              _tabIndex = index;
            });
            //回调
            if (widget.clickCallBack != null) {
              widget.clickCallBack(_tabIndex);
            }
          }
        },
        child: SizedBox(
          height: 52,
          child: buildPadItem(selectIndex, index, iconData, title),
        ),
      ),
    );
  }

  ///代码清单 13-4
  ///lib/src/page/custom_bottom_appbar.dart
  /// _CustomBottomAppBarState 中方法定义 图标按钮
  buildPadItem(int selectIndex, int index, IconData iconData, String title) {
    if (iconData == null) {
      return SizedBox();
    }

    //未选中状态的样式
    TextStyle textStyle = TextStyle(fontSize: 12.0, color: Colors.grey);
    MaterialColor iconColor = Colors.grey;
    double iconSize = 20;
    double padding = 8.0;

    if (selectIndex == index) {
      //选中状态的文字样式
      textStyle = TextStyle(fontSize: 13.0, color: Colors.blue);
      //选中状态的按钮样式
      iconColor = Colors.blue;
      iconSize = 25;
      padding = 6.0;
    }

    return Container(
      color: Colors.white,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  height: padding,
                ),
                Icon(
                  iconData,
                  color: iconColor,
                  size: iconSize,
                ),
                Text(
                  title,
                  style: textStyle,
                )
              ],
            ),
            //浮在表面的消息提示
            buildPointTips(widget.tipsIndex == index),
          ],
        ),
      ),
    );
  }

  ///代码清单 13-5
  ///lib/src/page/custom_bottom_appbar.dart
  /// _CustomBottomAppBarState 中方法定义 圆红点
  Widget buildPointTips(bool show) {
    if (!show) {
      return Container();
    }
    return Positioned(
      //右上角对齐
      right: 0,
      top: 6,
      child: Container(
        width: 6,
        height: 6,
        //圆角边框装饰
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(7))),
      ),
    );
  }
}
