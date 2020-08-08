import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data2022.dart
///   层叠布局
class StackMain3Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

//lib/code10/main_data2022.dart
GlobalKey _stackGlobalKey = new GlobalKey();
GlobalKey _conGlobalKey = new GlobalKey();
///Stack层叠布局
///子组件left、right、bottom、top
class _PageState extends State {
  @override
  Widget build(BuildContext context) {

    ///获取Stack的大小
    findWidgetSize();

    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局"),
      ),
      //通过ConstrainedBox来确保Stack占满屏幕
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          key: _stackGlobalKey,
          //居中
          alignment: AlignmentDirectional(0, 0),
          children: <Widget>[
            Positioned(
              top: 20,
              left: 100,
              right: 120,
              bottom: 300,
              child: Container(
                key: _conGlobalKey,
                padding: EdgeInsets.all(10),
                color: Colors.blue,
                child: Text("文本二", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
  //lib/code10/main_data2022.dart
  /// 获取Widget大小
  void findWidgetSize() {
    ///获取Stack的大小
    BuildContext stackContext = _stackGlobalKey.currentContext;
    if(stackContext!=null){
      RenderBox renderBox = stackContext.findRenderObject();
      if(renderBox!=null){
        Offset offset = renderBox.localToGlobal(Offset.zero);
        Size size =renderBox.paintBounds.size;
        print("当前Stack的大小为 ${size.toString()}");
      }
    }
    ///获取文本二的Containerk的大小
    BuildContext conContext = _conGlobalKey.currentContext;
    if(conContext!=null){
      RenderBox renderBox = conContext.findRenderObject();
      if(renderBox!=null){
        Offset offset = renderBox.localToGlobal(Offset.zero);
        Size size =renderBox.paintBounds.size;
        print("当前Containerk的大小为 ${size.toString()}");
      }
    }
  }
}
