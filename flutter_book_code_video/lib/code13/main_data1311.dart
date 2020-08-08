import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/common_utils.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/9.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

//lib/code/main_data1311.dart
//手势识别  Flutter获取点击元素的位置与大小
class BindingObservePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<BindingObservePage> {

  @override
  Widget build(BuildContext context) {

    ///获取手机状态栏的高度
    double statusTop = MediaQuery.of(context).padding.top;
    ///获取手机屏幕的宽度
    double width=MediaQuery.of(context).size.width;
    ///获取手机屏幕的高度
    double height=MediaQuery.of(context).size.height;
    print("appbar的高度为$kToolbarHeight");
    print("手机状态栏的高度为 $statusTop");
    print("手机屏幕  width $width  height $height");

    return Scaffold(
      appBar: AppBar(
        title: Text("获取关闭按钮的位置大小信息"),
      ),
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(bottom: 20,right: 20,child: Container(
            width: 160,
            height: 160,
            child: Image.asset(
              "assets/images/2.0x/banner1.webp",
              fit: BoxFit.fill,
            )
        ),),
        Positioned(bottom: 10,right: 10,child:  CloseTap3(),),
      ],),
    );
  }
}

//lib/code/main_data1311.dart
//关闭按钮 通过WidgetsBindingObserver来获取Widget的位置与大小信息
class CloseTap extends StatefulWidget {
  @override
  _CloseTapTapState createState() => _CloseTapTapState();
}

class _CloseTapTapState extends State<CloseTap> with WidgetsBindingObserver {
  ///关闭
  GlobalKey _closeGlobalKey = GlobalKey();
  void _onAfterRendering(Duration timeStamp) {
    RenderObject renderObject = context.findRenderObject();
    //获取元素大小
    Size size = renderObject.paintBounds.size;
    //获取元素位置
    var vector3 = renderObject.getTransformTo(null)?.getTranslation();
    final double dx = vector3[0];
    final double dy = vector3[1];
    print("获取到位置信息 dx=$dx  dy=$dy");
    print("元素的大小为 $size");

    //CommonUtils.showChooseDialog(context, size, vector3);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(Icons.close,key:_closeGlobalKey,),
      onTapDown: (TapDownDetails details) {


        WidgetsBinding.instance.addPostFrameCallback(_onAfterRendering);

        setState(() {});
      },
    );
  }
}



//lib/code/main_data1311.dart
//关闭按钮 通过GlobalKey来获取元素的位置与大小
class CloseTap2 extends StatefulWidget {
  @override
  _CloseTapTapState2 createState() => _CloseTapTapState2();
}

class _CloseTapTapState2 extends State<CloseTap2> with WidgetsBindingObserver {
  ///关闭按钮的主键
  GlobalKey _closeGlobalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(Icons.close,key:_closeGlobalKey,),
      onTapDown: (TapDownDetails details) {
        ///获取Widget对应的Context
        BuildContext radioContext = _closeGlobalKey.currentContext;
        if(radioContext!=null){
          ///获取RenderBox
          RenderBox renderBox = radioContext.findRenderObject();
          if(renderBox!=null){
            ///获取相对于屏幕的位置
            Offset localoffset = renderBox.localToGlobal(Offset.zero);
            Size size =renderBox.paintBounds.size;
            print("当前Widget的位置为  localoffset:${localoffset.toString()}");
            print("当前Widget的大小为 ${size.toString()}");

            final double dx = localoffset.dx;
            final double dy = localoffset.dy;
            print("获取到位置信息 dx=$dx  dy=$dy");
            //弹出弹框
            CommonUtils.showChooseDialog(context, Size(24,24), dx,dy);
          }

        }
        setState(() {});
      },
    );
  }
}


//lib/code/main_data1311.dart
//关闭按钮 通过手势识别获取手势包裹的Widget的位置与大小
class CloseTap3 extends StatefulWidget {
  @override
  _CloseTapTapState3 createState() => _CloseTapTapState3();
}

class _CloseTapTapState3 extends State<CloseTap3> with WidgetsBindingObserver {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(Icons.close,),
      onTapDown: (TapDownDetails details) {
        ///相对于父组件的位置
        Offset localPosition = details.localPosition;
        ///相对于屏幕的位置
        Offset globalPosition = details.globalPosition;
        print("获取到位置信息 localPosition=$localPosition  globalPosition=$globalPosition");
        ///对应Widget的左上角在屏幕中的位置
        Offset leftTopOffset =globalPosition -localPosition;

        final double dx = leftTopOffset.dx;
        final double dy = leftTopOffset.dy;
        print("获取到位置信息 dx=$dx  dy=$dy");
        //弹出弹框
        CommonUtils.showChooseDialog(context, Size(24,24), dx-localPosition.dx,dy);
      },
    );
  }
}