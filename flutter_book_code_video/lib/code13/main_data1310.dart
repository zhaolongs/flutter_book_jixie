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

//lib/code/main_data1310.dart
//手势识别  双指放大与缩小图片
class DoubleOnScaleImagePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<DoubleOnScaleImagePage> {
  ///缩放比例
  double _scale = 1.0;
  double _dscale = 0.0;
  double _prescale = 0.0;
  Offset preFocalPoint = Offset.zero;
  ///记录拖动位置
  Offset temp = Offset.zero;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("双指放大与缩小图片"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          ///缩放开始
          onScaleStart: (ScaleStartDetails details) {
            Offset localFocalPoint = details.localFocalPoint;
            Offset focalPoint = details.focalPoint;
            preFocalPoint = focalPoint;
            _prescale=0;

            print(
                "缩放开始 localFocalPoint $localFocalPoint focalPoint$focalPoint");
          },

          ///缩放更新
          onScaleUpdate: (ScaleUpdateDetails details) {
            double scale = details.scale;
            double horizontalScale = details.horizontalScale;
            double verticalScale = details.verticalScale;

            Offset localFocalPoint = details.localFocalPoint;
            Offset focalPoint = details.focalPoint;
            double rotation =details.rotation;
            print("onScaleUpdate 旋转 $_dscale rotation $rotation");

//            if (scale == 1.0) {
//              temp = focalPoint - preFocalPoint;
//              print("onScaleUpdate 移动 $scale  相对于父位置 $focalPoint");
//            } else {
//              _scale = scale;
//
//              print("onScaleUpdate 缩放 $scale 相对于父位置 $focalPoint");
//            }


            if(scale!=1.0) {
              _dscale = scale - 1;
              _prescale = _dscale;
              print("_dscale 缩放 $_dscale _prescale $_prescale");

            }
            setState(() {});
          },

          ///缩放结束
          onScaleEnd: (ScaleEndDetails details) {
            print("缩放结束");
            //缩放结束时在x、y轴上的速度
            Offset velocityOffset = details.velocity.pixelsPerSecond;
            //缩放结束时在y轴上的速度
            double velocityDy = velocityOffset.dy;
            print("缩放结束在x、y轴上的速度：$velocityOffset  ${details.velocity}");
          },
          child: buildScaleWidget(),
        ),
      ),
    );
  }

  //lib/code/main_data1310.dart
  //手势识别  双指放大与缩小图片
  ///手势识别事件的子Widget
  Widget buildScaleWidget() {
    return Container(
        width: 260,
        height: 260,
        child: Transform(
          transform: Matrix4.identity()..scale(_scale+_prescale, _scale+_prescale),
          child: Image.asset(
            "assets/images/2.0x/banner1.webp",
            fit: BoxFit.fill,
          ),
          alignment: Alignment.center,
        ));
  }
}
