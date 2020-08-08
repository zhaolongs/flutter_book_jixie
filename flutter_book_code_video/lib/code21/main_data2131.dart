import 'dart:ui';

import 'package:flutter/material.dart';

///lib/code21/main_data2131.dart
///评分显示组件
class StarRatinIconPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

///lib/code21/main_data2131.dart
class _PageState extends State  {


  num star1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("五角星评分"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  buildRatingStarWidget(),
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text("评分 $star1"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  ///lib/code21/main_data2131.dart
  ///构建五角星评分组件
  RatingStarWidget buildRatingStarWidget() {
    return RatingStarWidget(
      ///评分回调的数据类型
      starType: StarType.iStar,
      ///选中的五角星的高亮颜色
      selectColor: Colors.deepOrange[400],
      ///背景显示的五角星的颜色
      normalColor: Colors.grey[400],
      ///评分五角星的间隔
      space: 6,
      ///是否可滑动或者是点击修改评分值
      isAnimation: true,
      ///五角星个数
      totalNumber: 6,
      ///高亮显示的五角星的个数
      initNumber: 4,
      ///滑动或者点击评分修改后的回调
      selectCallback: (value) {
        print("选择的评分  $value");
        setState(() {
          star1 = value;
        });
      },
    );
  }
}

///lib/code21/main_data2131.dart
///评分组件
class RatingStarWidget extends StatefulWidget {
  ///五角星的总个数
  final int totalNumber;
  ///初始化的五星的个数
  final double initNumber;
  ///五角星的大小
  final double starSize;
  ///水平方向五角量之间的间隔
  final double space;
  ///评分类型 整数、小数、取半小数
  final StarType starType;
  ///是否可滑动点击修改
  final bool isAnimation;
  ///评分改动的回调
  final Function(num star) selectCallback;
  ///高亮显示的五角星
  final Color selectColor;
  ///背景显示的五角星
  final Color normalColor;

  RatingStarWidget(
      {this.totalNumber = 5,
      this.initNumber = 4.0,
      this.starSize = 33.0,
      this.starType = StarType.iStar,
      this.space = 8.0,
      this.isAnimation = true,
      this.selectColor = Colors.deepOrange,
      this.normalColor = Colors.grey,
      this.selectCallback});

  @override
  _StarState createState() => _StarState();
}

///lib/code21/main_data2131.dart
class _StarState extends State<RatingStarWidget> {
  ///记录手指在屏幕上的位置
  Offset _pointerOffset;
  ///所有五角星的宽度
  double _containerWidth;
  ///当前手指在评分组件上滑动的位置
  ///从 0.0到1.0
  double clipWidth;

  @override
  void initState() {
    ///为所有五角星的宽度 + 间隔之各
    _containerWidth = widget.totalNumber * widget.starSize +
        widget.space * (widget.totalNumber - 1);
    ///默认选中的位置计算
    double initWidth = widget.initNumber * widget.starSize +
        widget.space * (widget.initNumber - 1);
    _pointerOffset = Offset(initWidth, 0);
    super.initState();
    ///Widget渲染完成的回调
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ///计算宽度并刷新回调
      setState(() {
        clipWidth = calculateClipWidth();
      });
    });
  }
  ///lib/code21/main_data2131.dart
  ///[widget.isAnimation]为是否可滑动或者是点击修改评分
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1),
      ///当可修改时使用手势监听组件
      ///当不可修改时直接 构建五角星的内容主体
      child:
          widget.isAnimation ? buildGestureDetector() : buildContentContainer(),
    );
  }

  ///lib/code21/main_data2131.dart
  ///构建手势识别的组件功能
  ///在手指按下与水平滑动时获取位置
  GestureDetector buildGestureDetector() {
    return GestureDetector(
      ///手指按下
      onPanDown: (detail) {
        ///获取相对于父组件的位置
        _pointerOffset = detail.localPosition;
        setState(() {
          clipWidth = calculateClipWidth();
        });
      },
      ///手指移动 水平方向
      onHorizontalDragUpdate: (detail) {
        _pointerOffset = detail.localPosition;
        setState(() {
          ///计算
          clipWidth = calculateClipWidth();
        });
      },
      ///构建五角星的内容主体
      child: buildContentContainer(),
    );
  }

  ///lib/code21/main_data2131.dart
  ///构建评分五角星的内容主体
  Container buildContentContainer() {
    return Container(
        height: widget.starSize,
        width: _containerWidth,
        ///层叠布局
        child: Stack(
          children: [
            ///背景
            Row(
              mainAxisSize: MainAxisSize.min,
              children: buildStarWidget(widget.normalColor),
            ),
            ///选中的高谈颜色的构建
            buildSelectStarWidget(),
          ],
        ));
  }

  ///lib/code21/main_data2131.dart
  ///构建所的评分五角星
  ///[color] 用来设置五角星的填充颜色
  buildStarWidget(Color color) {
    List<Widget> list = [];
    for (var i = 0; i < widget.totalNumber; i++) {
      ///如果是最后一个不添加右侧内边距
      double rightSpacing = widget.space;
      if (i == widget.totalNumber - 1) {
        rightSpacing = 0.0;
      }
      list.add(Padding(
        padding: EdgeInsets.only(right: rightSpacing),
        child: Icon(
          Icons.star,
          color: color,
          size: widget.starSize,
        ),
      ));
    }
    return list;
  }
  ///lib/code21/main_data2131.dart
  ///构建显示高亮样式的评分五角星
  buildSelectStarWidget() {
    ///裁切显示
    return ClipRect(
        child: Align(
      ///从左向右
      alignment: Alignment.topLeft,
      ///裁切的大小
      widthFactor: clipWidth, //从左上角开始计算，显示一半的红色星
      ///组装所有的高亮评分五角星
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: buildStarWidget(widget.selectColor),
      ),
    ));
  }

  ///lib/code21/main_data2131.dart
  ///计算裁剪的宽度
  double calculateClipWidth() {
    ///用来记录当前的评分
    ///取值范围 0.0 ~ widget.totalNumber
    num callStar;
    ///计算当前滑动到的五角星的位置
    double start = _pointerOffset.dx / (widget.starSize + widget.space);
    switch (widget.starType) {
      case StarType.dStar:
        // 直接回调使用
        ///保留1位小数
        callStar = double.parse(start.toStringAsFixed(1));
        break;
      case StarType.iStar:
        //取整 四舍五入
        callStar = start.round().toInt();
        break;
      case StarType.bStar:
        //取半
        List list = "$start".split(".");
        String split = list[1];
        double splitDouble = double.parse("0.$split");
        if (splitDouble > 0.5) {
          callStar = double.parse("${int.parse(list[0]) + 1}");
        } else {
          callStar = double.parse("${list[0]}.5");
        }
        break;
    }
    ///边界计算限制
    if (callStar < 0) {
      callStar = 0;
    } else if (callStar > widget.totalNumber) {
      callStar = widget.totalNumber;
    }
    ///评分变动回调
    if (widget.selectCallback != null) {
      widget.selectCallback(callStar);
    }

    ///计算当前高亮显示的位置
    double clipReturnWidth = (
            ///滑动到的五角星位置
            callStar * widget.starSize +
                ///向上取整 计算间隔的个数
                ///然后计算出所有的间隔的距离
                (callStar.ceil() - 1) * widget.space) / _containerWidth;

    return clipReturnWidth;
  }
}


///lib/code21/main_data2131.dart
///评分类型
enum StarType {
  dStar, // 浮点类型 0.1、0.2、0.3 ...
  iStar, // 整型 0、1、2、3....
  bStar, // 浮点类型 取半 0.5、1.0、1.5 ....
}
