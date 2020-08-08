import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'main_data9014.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/5/30.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class DismissImagePage extends StatefulWidget {
  @override
  _RawImageState createState() => _RawImageState();
}

//lib/code/main_data9013.dart
//BackdropFilter 实现高斯模糊
class _RawImageState extends State<DismissImagePage> {

  DismissController dismissController = new DismissController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("高斯模糊"),
      ),

      ///填充布局
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(children: [
          DismissWidget(child:Text("这是一个文字 哈哈？？？"),dismissController: dismissController,),
          RaisedButton(child: Text("点击消失"),onPressed: (){
            dismissController.start();
          },),
          RaisedButton(child: Text("点击出现"),onPressed: (){
            dismissController.reverStart();
          },),
        ],),
      ),
    );
  }


}
