import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
/// lib/app/page/catalogue/read_book_page.dart
/// 翻书效果组件
/// [list]为一个书本中的所有页面的Widget集合
/// 可以为任意的[Widget]集合实现翻书效果
/// [onChangeCallBack]翻页时的回调
/// [onClickCallBack]点击当前页的回调
/// [loopDuration]翻页的时间 
/// [intervalDuration]当前页显示停留的时间
/// [height] [width] 书的大小
class ReadBookPage extends StatefulWidget {
  final List<Widget> list;
  final Function(int index) onChangeCallBack;
  final Function(int index) onClickCallBack;
  final Duration loopDuration;
  final Duration intervalDuration;
  final double height;
  final double width;

  ReadBookPage(
      {@required this.list,
      this.width,
      this.height,
      this.onChangeCallBack,
      this.onClickCallBack,
      this.loopDuration = const Duration(milliseconds: 1000),
      this.intervalDuration = const Duration(milliseconds: 5000)});

  @override
  _ReadBookState createState() => _ReadBookState();
}


class _ReadBookState extends State<ReadBookPage> with TickerProviderStateMixin {
  /// lib/app/page/catalogue/read_book_page.dart
  AnimationController _animationController;
  Animation _animation;
  Animation _animation1;

  ///书本的大小
  double width;
  double height;

  @override
  void initState() {
    width = widget.width;
    height = widget.height;
    ///创建控制器并设
    _animationController =
        AnimationController(vsync: this, duration: widget.loopDuration);
    ///从0执行到90度
    _animation = Tween(begin: 0.0, end: pi / 2).animate(
        CurvedAnimation(parent: _animationController, curve: Interval(.0, .5)));
    ///从-90度执行到0度
    _animation1 = Tween(begin: -pi / 2, end: 0.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(.5, 1.0)));
    ///置刷新监听
    _animationController.addListener(() {
      setState(() {});
    });
    ///设置状态监听
    ///处理翻页的逻辑
    _animationController.addStatusListener(animationStatusFunction);
    super.initState();
    ///默认开启翻页动画
    Future.delayed(widget.intervalDuration,(){
      _animationController.forward();
    });
  }
  /// lib/app/page/catalogue/read_book_page.dart
  ///动画执行兼听
  void animationStatusFunction(status) {
    if (status == AnimationStatus.completed) {
      ///翻页结束后 在页面可见的时候 
      /// 延迟执行下一次执行
      /// 表现为显示当前页效果
      Future.delayed(widget.intervalDuration,(){
        if(_animationController!=null&&mounted) {
       setState(() {
         ///因为这里是触发翻页效果的
         ///所以相对来说 为即将翻过去的页码
         index++;
         ///为当前翻页结束显示的页码
         next = index + 1;
         ///边界判断，如果当前显示的是最后一页
         ///在翻页显示下一页应该是第一页
         if (index == widget.list.length - 1) {
           next = 0;
         }
         ///如果index自增超出边界
         ///重置一下
         if (index == widget.list.length) {
           index = 0;
           next = 1;
         }
         ///触发翻页回调
         if (widget.onChangeCallBack != null) {
           widget.onChangeCallBack(next);
         }
         ///重置
         _animationController.reset();
         ///开启
         _animationController.forward();
       });
        }
      });
  
    } else if (status == AnimationStatus.dismissed) {
      _animationController.forward();
    }
  }
  /// lib/app/page/catalogue/read_book_page.dart
  ///水平滑动的偏移量
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      ///填充布局
      body: Container(
        width:width==null?double.infinity:widget.width,
        height:height==null?200:widget.height,
        child: GestureDetector(
          ///当手指按下时停止翻书 
          onTapDown: (TapDownDetails details){
            _animationController.stop();
          },
          ///当手指抬起时继续翻书
          ///并触发单击回调
          onTap: (){
            if(widget.onClickCallBack!=null){
              widget.onClickCallBack(index);
            }
            _animationController.forward();
          },
          ///当手指按下移出区域继续翻书
          onTapCancel: (){
            _animationController.forward();
          },
          ///手指水平方向移动时
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            horizontalDragUpdate(details, context);
          },

          ///滑动结束时回调 水平方向
          onHorizontalDragEnd: (DragEndDetails details) {
            //滑动结束时在x、y轴上的速度
            Offset velocityOffset = details.velocity.pixelsPerSecond;
            //滑动结束时在y轴上的速度
            double velocityDX = velocityOffset.dx;
            _left = 0;
          },
         ///每一页显示的Widget
          child: buildRow(),
        ),
      ),
    );
  }
  /// lib/app/page/catalogue/read_book_page.dart
  /// 水平滑动时翻动当前正在翻页的页面
  void horizontalDragUpdate(DragUpdateDetails details, BuildContext context) {
    setState(() {
      ///获取在x轴与y轴上的滑动偏移量
      Offset dOffset = details.delta;
      ///dy为手指移动在y轴方向上的偏移量
      double dx = dOffset.dx;
      ///水平滑动偏移量缩小100倍以降低灵敏度
      _left = _left + dx/100;
      double width = MediaQuery.of(context).size.width;
      ///取相反数，向左滑动[_left]是负值
      ///此时需要[_animationController]向左执行，即增大
      double flag = -pi*_left/width;
      ///设置翻书的角度 
      _animationController.value=_animationController.value+flag;
      print("水平方向 滑动 $dx flag $flag value ${_animationController.value}");
    });
  }

  ///构建每一页的内容
  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ///书的第一层页面
        buildFirstStack(),
        ///中间的分割线
        Container(
          width: 0.2, color: Colors.deepPurple,
        ),
        ///书的右半部分
        buildScendStack()
      ],
    );
  }
  /// lib/app/page/catalogue/read_book_page.dart
  ///第二层页面
  Stack buildScendStack() {
    return Stack(
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.centerRight,
              widthFactor: 0.5,
              ///B2页面
              child: buildNextWidget(),
            ),
          ),
          Transform(
            alignment: Alignment.centerLeft,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_animation.value),
            child: ClipRect(
              child: Align(
                alignment: Alignment.centerRight,
                widthFactor: 0.5,
                ///A2页面
                child: buildCurrentWidget(),
              ),
            ),
          )
        ],
      );
  }
  /// lib/app/page/catalogue/read_book_page.dart
  ///书的第一层
  Stack buildFirstStack() {
    return Stack(
        children: [
          ClipRect(
            child: Align(
              ///从左向右裁剪
              alignment: Alignment.centerLeft,
              ///裁剪一半
              widthFactor: 0.5,
              ///A1页面的左半部分
              child: buildCurrentWidget(),
            ),
          ),
          Transform(
            ///旋转中心
            alignment: Alignment.centerRight,
            transform: Matrix4.identity()
              ///透视旋转
              ..setEntry(3, 2, 0.001)
              ///绕Y轴旋转
              ..rotateY(_animation1.value),
            child: ClipRect(
              child: Align(
                alignment: Alignment.centerLeft,
                widthFactor: 0.5,
                ///B1页面的左半部分
                child: buildNextWidget(),
              ),
            ),
          ),
        ],
      );
  }
  /// lib/app/page/catalogue/read_book_page.dart
  ///默认当前显示的页面
  int index = 0;
  ///即将翻页显示的页面页码
  int next = 1;
  ///A页面对应的Widget
  Widget buildCurrentWidget(){
    return widget.list[index];
  }
  ///B页面对应的Widget
  Widget buildNextWidget(){
    return widget.list[next];
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController=null;
    super.dispose();
  }
}
