import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///7 /lib/code20/main_data124.dart
///  Canvas 图形变换
class CanvasXYZUsePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }
  ///页面的主体
  buildBody1(){


    return Scaffold(
      appBar: AppBar(title: Text("Canvas 图形变换"),),
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [



      ],),),
    );
  }



}
