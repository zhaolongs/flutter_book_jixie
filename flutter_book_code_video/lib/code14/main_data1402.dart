import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/26.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

//lib/code14/main_data1402.dart
class SwitchBaseUsePage2 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code14/main_data1402.dart
class _TestPageState extends State<SwitchBaseUsePage2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("开关Switch的基本使用"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              buildSwitchWidget2(),
              SizedBox(height: 40,),
              buildSwitchWidget(),
            ],
          )),
    );
  }

 //lib/code14/main_data1402.dart
  ///记录开关的状态
  bool switchValue = false;

  GlobalKey _key = GlobalKey();

  ///开关[Switch]的打开状态下相关颜色配制
  Widget buildSwitchWidget() {
    ///获取Switch的大小
    if(_key.currentContext!=null
        &&_key.currentContext.findRenderObject()!=null){
      Size size = _key.currentContext.findRenderObject().paintBounds.size;
      print("Switch 的大小为 ${size.toString()}");
    }
    return Switch(
      key:_key ,
      ///打开状态下 圆点的颜色
      activeColor: Colors.blue,
      ///打开状态下轨道颜色
      ///因为开关的打开与关闭是一个滑动运动的过程
      ///所以Track可理解为是 状态圆点滑动过的轨迹
      activeTrackColor: Colors.red,
      ///关闭状态下 圆点的颜色
      inactiveThumbColor: Colors.black,
      ///关闭状态下轨道颜色
      inactiveTrackColor: Colors.grey,
      ///配制点击区域的大小
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ///状态回调
      onChanged: (bool value) {
        setState(() {
          switchValue = value;
        });
      },
      ///对应的值
      value: switchValue,
    );
  }

  //lib/code14/main_data1402.dart
  ///记录开关的状态
  bool cuperSwitchValue = false;
  GlobalKey _cuperKey = GlobalKey();
  ///开关[CupertinoSwitch]的属性配制
  ///iOS风格的开关
  Widget buildSwitchWidget2() {
    ///苹果网格的开关
    return CupertinoSwitch(
      ///主键配置
      key: _cuperKey,
      ///开关打开时的背景颜色
      activeColor: Colors.red,
      ///形状关闭时的背景颜色
      trackColor: Colors.blue,
      dragStartBehavior: DragStartBehavior.down,
      onChanged: (bool value) {
        setState(() {
          cuperSwitchValue = value;
        });
      },
      value: cuperSwitchValue,
    );
  }
}