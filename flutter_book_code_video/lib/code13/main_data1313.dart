import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/9.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

//lib/code/main_data1313.dart
//手势识别  双指旋转、缩放、拖动图片
class RoteAndScaleImagePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<RoteAndScaleImagePage> {
  ///手势的旋转弧度
  double _rotation = 0.0;
  ///当前图片的旋转弧度
  double _currentRotation = 0.0;
  ///手势缩放的变化
  double _scale = 0.0;
  ///当前图片的缩放比例
  double _currentScale = 1.0;

  ///手指按下的点位
  Offset downFocalPoint = Offset.zero;
  ///手指滑动的偏移量
  Offset flagOffset = Offset.zero;
  ///当前图片位置偏移量
  Offset currentOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("旋转、缩放、拖动图片"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onScaleStart: (ScaleStartDetails details) {
            ///记录手指按下的点位置
            downFocalPoint = details.focalPoint;
            print("onScaleStart $downFocalPoint");
          },
          onScaleEnd: (ScaleEndDetails details) {
            ///记录最后的缩放大小
            _currentScale += _scale;
            _scale = 0.0;
            ///记录最后的旋转大小
            _currentRotation += _rotation;
            _rotation = 0.0;
            ///记录最后的拖动位置
            currentOffset += flagOffset;
            flagOffset = Offset.zero;
            print("onScaleEnd $_currentScale");
          },

          ///缩放更新
          onScaleUpdate: (ScaleUpdateDetails details) {
            ///获取当前的缩放仩
            double scale = details.scale;
            ///获取当前手指滑到的点
            Offset focalPoint = details.focalPoint;
            if (focalPoint != downFocalPoint) {
              print("onScaleUpdate $focalPoint");
              if (scale == 1.0) {
                ///滑动 当前的点位-按下的点位 为滑动的偏移值
                flagOffset = focalPoint - downFocalPoint;
              } else {
                ///缩放 计算缩放变化的值
                _scale = scale - 1.0;
              }
              ///获取旋转的角度
              ///正值为顺时针旋转
              ///负值为逆时针旋转
              double rotation = details.rotation;
              print("onScaleUpdate rotation $rotation");
              setState(() {
                _rotation = rotation;
              });
            }
          },
          child: Container(
              width: 260,
              height: 260,
              child: Transform(
                transform: Matrix4.identity()

                  ///旋转
                  ..rotateZ(_currentRotation + _rotation)

                  ///等比缩放
                  ..scale(_currentScale + _scale, _currentScale + _scale)

                  ///平移
                  ..translate((currentOffset + flagOffset).dx,
                      (currentOffset + flagOffset).dy),
                child: Image.asset(
                  "assets/images/2.0x/banner1.webp",
                  fit: BoxFit.fill,
                ),
                alignment: Alignment.center,
              )),
        ),
      ),
    );
  }
}
