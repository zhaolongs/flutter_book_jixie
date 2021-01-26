import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example817(),
  ));
}

class Example817 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State with SingleTickerProviderStateMixin {
  //动画控制器
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    //创建
    _animationController = new AnimationController(
        vsync: this,
        lowerBound: 0.6,
        upperBound: 2.0,
        duration: Duration(
          milliseconds: 1600,
        ));
    //添加监听
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("绘图应用"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: ClipShadow(
              clipper: RoundedPathClipper(),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(_animationController.value * -5,
                      _animationController.value * -5),
                  spreadRadius: 1,
                  blurRadius: 15,
                ),
                BoxShadow(
                  color: Color(0XFF748CAC).withOpacity(.6),
                  offset: Offset(_animationController.value * 7,
                      _animationController.value * 6),
                  spreadRadius: 1,
                  blurRadius: 15,
                ),
              ],
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(36.0)),
                  color: Color(0XffCDDEEC),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CustomIconButton(
                          iconData: Icons.dehaze,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("升起"),
                onPressed: () {
                  _animationController.reset();
                  _animationController.forward();
                },
              ),
              SizedBox(
                width: 12,
              ),
              ElevatedButton(
                child: Text("回落"),
                onPressed: () {
                  _animationController.reverse();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class ClipShadow extends StatelessWidget {
  /// A list of shadows cast by this box behind the box.
  final List<BoxShadow> boxShadow;

  /// If non-null, determines which clip to use.
  final CustomClipper<Path> clipper;

  /// The [Widget] below this widget in the tree.
  final Widget child;

  ClipShadow(
      {@required this.boxShadow, @required this.clipper, @required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowPainter(clipShadow: boxShadow, clipper: clipper),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}

class _ClipShadowPainter extends CustomPainter {
  ///剪裁
  final CustomClipper<Path> clipper;
  ///阴影合辑
  final List<BoxShadow> clipShadow;

  _ClipShadowPainter({@required this.clipper, @required this.clipShadow});

  @override
  void paint(Canvas canvas, Size size) {
    //循环绘制阴影
    clipShadow.forEach((BoxShadow shadow) {
      //获取阴影对应的画笔
      Paint shadowPaint = shadow.toPaint();
      //当前画布的大小 与 阴影的 模糊之和
      Size spreadSize = Size(size.width + shadow.spreadRadius * 2,
          size.height + shadow.spreadRadius * 2);
      //根据新测量的大小来构建新的Path
      var clipPath = clipper.getClip(spreadSize).shift(Offset(
          shadow.offset.dx  - shadow.spreadRadius,
          shadow.offset.dy - shadow.spreadRadius),);
      //绘制路径
      canvas.drawPath(clipPath, shadowPaint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RoundedPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print("size is ${size.toString()}");
    double width = size.width;
    double height = size.height;
    Path path = Path()
      ..lineTo(0.0, height)
      ..lineTo(width, height)
      ..lineTo(width, 0.0)
      ..quadraticBezierTo(width, 0.0, width * 19 / 20, 0.0)
      ..lineTo(width / 10, height / 10 * 2 - height / 40)
      ..quadraticBezierTo(width / 40, height / 5, 0.0, height / 10 * 3)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomIconButton extends StatefulWidget {
  final IconData iconData;

  const CustomIconButton({Key key, @required this.iconData}) : super(key: key);

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _active = !_active;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFEFF4F8),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5, -5),
              spreadRadius: 1,
              blurRadius: 15,
            ),
            BoxShadow(
              color: Color(0XFF748CAC).withOpacity(.6),
              offset: Offset(5, 5),
              spreadRadius: 1,
              blurRadius: 15,
            ),
          ],
          gradient: _active
              ? LinearGradient(colors: <Color>[
                  Color(0XffE5EEF4),
                  Color(0XffCDDEEC),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
              : null,
        ),
        child: Center(
          child: Icon(
            widget.iconData,
            size: 30,
            color: _active ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
