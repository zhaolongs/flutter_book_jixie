import 'dart:math' as math;

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
class InkWellUsePage3 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1319.dart
//Inkew
class _TestPageState extends State<InkWellUsePage3> {
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      print("focusNode 焦点${focusNode.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("点击事件"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
            SizedBox(
              height: 40,
            ),
            buildInkWellContainer(),
            SizedBox(
              height: 40,
            ),
            buildInkWellContainer2(),
            SizedBox(
              height: 40,
            ),
            buildInkWellContainer3(),
            SizedBox(
              height: 40,
            ),
            buildInkWellContainer4(),
            SizedBox(
              height: 40,
            ),
            FlatButton(
              child: Text("获取焦点"),
              onPressed: () {
                FocusScope.of(context).requestFocus(focusNode);
              },
            ),
            FlatButton(
              child: Text("取消焦点"),
              onPressed: () {
                focusNode.unfocus();
              },
            )
          ],
        ),
      ),
    );
  }

  //lib/code/main_data1319.dart
  ///通过 [InkWell] 的事件回调
  Widget buildInkWellContainer() {
    return new InkWell(
      //点击事件回调
      onTap: () {
        print("onTap 单击回调");
      },
      onDoubleTap: () {
        print("onTap 双击回调");
      },
      onLongPress: () {
        print("onLongPress 长按回调");
      },

      ///手指按下的回调
      onTapDown: (TapDownDetails details) {
        print("onTapDown 手指按下");
      },

      ///手指按下后再滑动移出事件监听范围内
      onTapCancel: () {
        print("onTapCancel 手指移出事件监听范围");
      },

      ///当按下按钮显示高亮颜色时的回调
      onHighlightChanged: (bool value) {
        print("onHighlightChanged 高亮$value");
      },

      ///在web中鼠标移动到监听事件上时的回调
      onHover: (bool value) {
        print("onHover 获取焦点$value");
      },

      ///需要设置点击事件的子Widget
      //不要在这里设置背景色，否则会遮挡水波纹效果,
      child: buildContainer(),
    );
  }

  Widget buildInkWellContainer2() {
    return new InkWell(
      //点击事件回调
      onTap: () {
        print("onTap 单击回调");
      },
      onDoubleTap: () {
        print("onTap 双击回调");
      },

      ///手指按下的回调
      onTapDown: (TapDownDetails details) {
        print("onTapDown 手指按下");
      },

      ///手指按下后再滑动移出事件监听范围内
      onTapCancel: () {
        print("onTapCancel 手指移出事件监听范围");
      },

      ///当按下按钮显示高亮颜色时的回调
      onHighlightChanged: (bool value) {
        print("onHighlightChanged 高亮$value");
      },

      ///在web中鼠标移动到监听事件上时的回调
      onHover: (bool value) {
        print("onHover 获取焦点$value");
      },

      ///需要设置点击事件的子Widget
      //不要在这里设置背景色，否则会遮挡水波纹效果,
      child: buildContainer(),
    );
  }

  /*
      Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
   */

  FocusNode focusNode = new FocusNode();

  //lib/code/main_data1319.dart
  ///相关颜色属性配制
  Widget buildInkWellContainer3() {
    return new InkWell(
      ///获取焦点时显示的颜色 在web开发中有效果
      focusColor: Colors.deepPurpleAccent,
      ///web开发中 鼠标指针浮动在上面时显示的颜色
      hoverColor: Colors.deepOrange,
      ///按下时高亮颜色配置
      highlightColor: Colors.blue,
      ///水波纹颜色配制
      splashColor: Colors.grey,
      splashFactory: CustomSplashFactory(),
      focusNode: focusNode,
      //点击事件回调
      onTap: () {
        print("onTap 单击回调");
      },
      onDoubleTap: () {
        print("onTap 双击回调");
      },

      ///手指按下的回调
      onTapDown: (TapDownDetails details) {
        print("onTapDown 手指按下");
      },

      ///手指按下后再滑动移出事件监听范围内
      onTapCancel: () {
        print("onTapCancel 手指移出事件监听范围");
      },

      ///当按下按钮显示高亮颜色时的回调
      onHighlightChanged: (bool value) {
        print("onHighlightChanged 高亮$value");
      },

      ///在web中鼠标移动到监听事件上时的回调
      onHover: (bool value) {
        print("onHover 获取焦点$value");
      },

      ///需要设置点击事件的子Widget
      //不要在这里设置背景色，否则会遮挡水波纹效果,
      child: buildContainer(),
    );
  }

  //lib/code/main_data1319.dart
  ///相关颜色属性配制
  Widget buildInkWellContainer4() {
    return new InkWell(
      //水波纹执行的半径
     // radius: 30,
      borderRadius: BorderRadius.all(Radius.circular(50)),
      ///水波纹颜色配制
      splashColor: Colors.grey,
      ///自定义水波纹效果
      splashFactory: CustomSplashFactory(
        ///手指按下后水波纹执行的时间
        confirmedSplashDuration:Duration(seconds: 2),
        ///当手指抬起时如果水波纹没有执行完成时
        ///开启的水波纹消失的透明动画的执行时间
        splashFadeDuration:Duration(seconds: 2),),
      //点击事件回调
      onTap: () {
        print("onTap 单击回调");
      },
      ///需要设置点击事件的子Widget
      child: buildContainer(),
    );
  }
  /*
      GestureTapCallback onTap,
    GestureTapCallback onDoubleTap,
    GestureLongPressCallback onLongPress,
    GestureTapDownCallback onTapDown,
    GestureTapCancelCallback onTapCancel,
    ValueChanged<bool> onHighlightChanged,
    ValueChanged<bool> onHover,
   */

  ///常见的子类
  Container buildContainer() {
    return new Container(
      width: 300.0,
      height: 50.0,
      //设置child 居中
      alignment: Alignment(0, 0),
      child: Text(
        "登录",
        style: TextStyle(color: Colors.red, fontSize: 16.0),
      ),
    );
  }
}



//lib/code/main_data1319.dart
///用来创建水波纹效果的 Factory类
class CustomSplashFactory extends InteractiveInkFeatureFactory {
  final Duration confirmedSplashDuration;
  final Duration splashFadeDuration;
  const CustomSplashFactory({this.confirmedSplashDuration,this.splashFadeDuration});
  ///通过create来创建InteractiveInkFeature
  @override
  InteractiveInkFeature create(
      {MaterialInkController controller,
      RenderBox referenceBox,
      Offset position,
      Color color,
      TextDirection textDirection,
      bool containedInkWell = false,
      rectCallback,
      BorderRadius borderRadius,
      ShapeBorder customBorder,
      double radius,
      onRemoved}) {
    ///创建自定义的InteractiveInkFeature
    return new CustomSplash(
      controller: controller,
      referenceBox: referenceBox,
      position: position,
      color: color,
      containedInkWell: containedInkWell,
      rectCallback: rectCallback,
      borderRadius: borderRadius,
      radius: radius,
      onRemoved: onRemoved,
      confirmedSplashDuration: confirmedSplashDuration,
      splashFadeDuration:splashFadeDuration,
    );
  }
}

//lib/code/main_data1319.dart
const double _kSplashConfirmedVelocity = 0.1;

///自定义InteractiveInkFeature
///为 [InkWell], [InkResponse] 或者是 material [Theme]
///设置水波纹效果
class CustomSplash extends InteractiveInkFeature {

  static const InteractiveInkFeatureFactory splashFactory =
      const CustomSplashFactory();

  ///手指的点击位置 相对于父布局
  final Offset _position;
  final BorderRadius _borderRadius;
  ///水波纹执行的最大半径
  final double _targetRadius;
  final RectCallback _clipCallback;
  ///水波纹是否填充InkWell监听区域
  final bool _repositionToReferenceBox;

  Animation<double> _radius;
  AnimationController _radiusController;

  Animation<int> _alpha;
  AnimationController _alphaController;
  ///绘制水波纹使用的画笔
  final Paint paint = new Paint();

  /// 相对于[referenceBox]中间位置触发水波纹效果
  /// [position]手指的点击位置 相对于父布局
  /// 其中的 [controller] 的参数是通过 Material.of(context)来获取的
  ///
  /// 如果[containedInkWell]的值为true, 按下时的水波纹效果将会填充InkWell的矩形区域
  /// 当手指按下时会触发[rectCallback]函数回调
  /// 当水波纹移除时会执行[onRemoved]方法
  /// [borderRadius]
  /// [radius] 用来配置水波纹执行的最大半径的大小
  /// [confirmedSplashDuration] 按下时水波纹执行的时间
  /// [splashFadeDuration] 水波纹消失时的透明动画执行时间
  /// [splashInitialSize] 水波纹开始执行的半径 默认从0开始
  CustomSplash({
    @required MaterialInkController controller,
    @required RenderBox referenceBox,
    Offset position,
    Color color,
    bool containedInkWell = false,
    RectCallback rectCallback,
    BorderRadius borderRadius,
    double radius,
    VoidCallback onRemoved,
    Duration confirmedSplashDuration=const Duration(milliseconds: 2000),
    Duration splashFadeDuration=const Duration(milliseconds: 2000),
    double splashInitialSize =0.0,
  })  : _position = position,
        _borderRadius = borderRadius ?? BorderRadius.zero,
       ///当水波纹执行的最大半径radius没有配制时 来计算这个半径
        _targetRadius = radius ??
            _getTargetRadius(
                referenceBox, containedInkWell, rectCallback, position),
       ///计算绘制水波纹效果的画布大小
        _clipCallback =
            _getClipCallback(referenceBox, containedInkWell, rectCallback),
        _repositionToReferenceBox = !containedInkWell,
        super(
            controller: controller,
            referenceBox: referenceBox,
            color: color,
            onRemoved: onRemoved) {
    assert(_borderRadius != null);

    ///水波纹动画控制器
    _radiusController = new AnimationController(
        duration: confirmedSplashDuration, vsync: controller.vsync)
      ..addListener(controller.markNeedsPaint)
      ..forward();
    ///水波纹的半径变化
    _radius = new Tween<double>(begin: splashInitialSize, end: _targetRadius)
        .animate(_radiusController);

    ///透明动画控制器
    _alphaController = new AnimationController(
        duration: splashFadeDuration, vsync: controller.vsync)
    ///添加动画更新监听
      ..addListener(controller.markNeedsPaint)
      ///添加动画状态监听
      ..addStatusListener(_handleAlphaStatusChanged);
    _alpha = new IntTween(begin: color.alpha, end: 0).animate(_alphaController);

    controller.addInkFeature(this);
  }


 ///当手指抬起时回调的函数
  @override
  void confirm() {
    ///floor函数 向下取整
    final int duration = (_targetRadius / _kSplashConfirmedVelocity).floor();
    _radiusController
      ..duration = new Duration(milliseconds: duration)
      ..forward();
    ///开启透明消失动画
    _alphaController.forward();
  }

  ///当手指移出监听事件区域时回调的函数
  @override
  void cancel() {
    _alphaController?.forward();
  }
  ///透明动画状态更新回调
  void _handleAlphaStatusChanged(AnimationStatus status) {
    ///当透明动画执行完毕时 释放动画控制器
    if (status == AnimationStatus.completed) dispose();
  }
  @override
  void dispose() {
    _radiusController.dispose();
    _alphaController.dispose();
    _alphaController = null;
    super.dispose();
  }

  ///绘制水波纹
  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {
    ///设置画笔颜色的透明度
    paint.color = color.withAlpha(_alpha.value);
    ///开始绘制圆形水波纹的中心点
    Offset center = _position;
    if (_repositionToReferenceBox) {
      center = Offset.lerp(center, referenceBox.size.center(Offset.zero),
          _radiusController.value);
    }
    print("绘制水波纹中心点 $center ");
    final Offset originOffset = MatrixUtils.getAsTranslation(transform);
    if (originOffset == null) {
      canvas.save();
      canvas.transform(transform.storage);
      if (_clipCallback != null) {
        _clipCanvasWithRect(canvas, _clipCallback());
      }
      canvas.drawCircle(center, _radius.value, paint);
      canvas.restore();
    } else {
      if (_clipCallback != null) {
        canvas.save();
        _clipCanvasWithRect(canvas, _clipCallback(), offset: originOffset);
      }
      canvas.drawCircle(center + originOffset, _radius.value, paint);
      if (_clipCallback != null) canvas.restore();
    }
  }


  RRect _clipRRectFromRect(Rect rect) {
    return new RRect.fromRectAndCorners(
      rect,
      topLeft: _borderRadius.topLeft,
      topRight: _borderRadius.topRight,
      bottomLeft: _borderRadius.bottomLeft,
      bottomRight: _borderRadius.bottomRight,
    );
  }

  void _clipCanvasWithRect(Canvas canvas, Rect rect, {Offset offset}) {
    Rect clipRect = rect;
    if (offset != null) {
      clipRect = clipRect.shift(offset);
    }
    if (_borderRadius != BorderRadius.zero) {
      canvas.clipRRect(_clipRRectFromRect(clipRect));
    } else {
      canvas.clipRect(clipRect);
    }
  }

}


//lib/code/main_data1319.dart
///当水波纹执行的最大半径radius没有配制时
///通过此方法来计算这个半径
///[position]手指的点击位置
double _getTargetRadius(RenderBox referenceBox, bool containedInkWell,
    RectCallback rectCallback, Offset position) {
  ///
  if (containedInkWell) {
    ///优先获取 rectCallback 返回的Size大小
    ///如果 rectCallback 为空就获取当前 InkWell的大小
    ///rectCallback 是从 Factory的create方法中传回来的
    ///其创建 方式为 RectCallback rectCallback
    ///       = widget.containedInkWell ? widget.getRectCallback(referenceBox) : null;
    ///       也就是获取的当前点击事件InkWell监听的范围
    final Size size = rectCallback != null ? rectCallback().size : referenceBox.size;
    ///通过 可执行动画的范围 size 与手指按下的位置 position 来计算
    ///水波纹可执行的最大距离
    return _getSplashRadiusForPositionInSize(size, position);
  }
  /// Material风格默认  35.0 像素
  return Material.defaultSplashRadius;
}

///通过 可执行动画的范围 size [bounds] 与手指按下的位置 [position] 来计算
///水波纹可执行的最大距离
double _getSplashRadiusForPositionInSize(Size bounds, Offset position) {
  ///分别计算手指按下的位置与水波纹可执行范围四周边框的距离
  final double d1 = (position - bounds.topLeft(Offset.zero)).distance;
  final double d2 = (position - bounds.topRight(Offset.zero)).distance;
  final double d3 = (position - bounds.bottomLeft(Offset.zero)).distance;
  final double d4 = (position - bounds.bottomRight(Offset.zero)).distance;
  ///然后四个距离中取个最大值
  ///并且通过ceilToDouble函数向上取舍
  return math.max(math.max(d1, d2), math.max(d3, d4)).ceilToDouble();
}

///计算绘制水波纹效果的画布大小
RectCallback _getClipCallback(
    RenderBox referenceBox, bool containedInkWell, RectCallback rectCallback) {
  if (rectCallback != null) {
    assert(containedInkWell);
    return rectCallback;
  }
  if (containedInkWell) return () => Offset.zero & referenceBox.size;
  return null;
}
