import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/19.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///lib/utils/canvas_path_utils.dart
/// 绘图路径构建
/// [nStarPath] n角星路径
/// [regularStarPath] 正n角星路径
/// [regularPolygonPath]正n边形
class CanvasPathUtils {
  /// n角星路径
  /// [startNumber] 几角星
  /// [outRadius] 外接圆半径
  /// [innerRadius] 内接圆半径
  /// @return n角星路径
  static Path nStarPath(int startNumber, double outRadius, double innerRadius) {
    Path path = new Path();
    double perDeg = 360 / startNumber;
    double degA = perDeg / 2 / 2;
    double degB = 360 / (startNumber - 1) / 2 - degA / 2 + degA;
    path.moveTo((cos(angleToRadian(degA + perDeg * 0)) * outRadius + outRadius * cos(angleToRadian(degA))),
        (-sin(angleToRadian(degA + perDeg * 0)) * outRadius + outRadius));
    for (int i = 0; i < startNumber; i++) {
      path.lineTo((cos(angleToRadian(degA + perDeg * i)) * outRadius + outRadius * cos(angleToRadian(degA))),
          (-sin(angleToRadian(degA + perDeg * i)) * outRadius + outRadius));
      path.lineTo((cos(angleToRadian(degB + perDeg * i)) * innerRadius + outRadius * cos(angleToRadian(degA))),
          (-sin(angleToRadian(degB + perDeg * i)) * innerRadius + outRadius));
    }
    path.close();
    return path;
  }

  /// 角度制化为弧度制
  /// angleToRadian
  ///[deg] 角度
  ///[radian]弧度
  static angleToRadian(double deg) {
    double radian =deg * pi / 180;
    return radian;
  }

  /// 画正n角星的路径:
  /// [startNumber]角数
  /// [outRadius]  外接圆半径
  /// @return 画正n角星的路径
  static Path regularStarPath({@required int startNumber,@required double outRadius}) {
    double degA, degB;
    if (startNumber % 2 == 1) {
      //奇数和偶数角区别对待
      degA = 360 / startNumber / 2 / 2;
      degB = 180 - degA - 360 / startNumber / 2;
    } else {
      degA = 360 / startNumber / 2;
      degB = 180 - degA - 360 / startNumber / 2;
    }
    double r = (outRadius * sin(angleToRadian(degA)).toDouble() / sin(angleToRadian(degB)));
    return nStarPath(startNumber, outRadius, r);
  }

  /// 画正n边形的路径
  /// [sliderNumber]边数
  /// [outRadius]  外接圆半径
  /// @return 画正n边形的路径
  static Path regularPolygonPath({@required int sliderNumber,@required double outRadius}) {
    double r = (outRadius * (cos(angleToRadian(360 / sliderNumber / 2))).toDouble()); //!!一点解决
    return nStarPath(sliderNumber, outRadius, r);
  }
}
