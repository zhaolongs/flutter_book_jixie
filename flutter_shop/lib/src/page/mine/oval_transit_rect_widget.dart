import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/12/4.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// 
/// 代码清单 
///代码清单
class OvalTransitRectWidget extends StatelessWidget {
  OvalTransitRectWidget({
    Key key,
    @required this.maxRadius,
    @required this.child,
  })  : clipRectSize = 2.0 * (maxRadius /sqrt2),
        super(key: key);

  final double maxRadius;
  final double clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}