import 'dart:ui';

import 'package:flutter/material.dart';

import 'bezier/bezier_paper.dart';

///   绘制粒子动画s
class DrawBezierDemoPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

//lib/code20/main_data2125.dart
class _PageState extends State with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
////横屏
//    SystemChrome.setPreferredOrientations(
//        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
//    //全屏显示
//    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Offset _pointer=Offset.zero;
  //lib/code20/main_data2125.dart
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (detail) {
       setState(() {
         _pointer = detail.localPosition;
       });
      },

      onPanUpdate: (detail) {
        setState(() {
          _pointer = detail.localPosition;
        });
      },
      child: CustomPaint(
        painter: BezierPainter(pointer: _pointer),
      ),
    );
  }
}
