import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//lib/code7/main_data7005.dart
///RaisedButton与FlatButto的.icon
class FlatButtonPage3 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  ///页面的主体
  buildBody1() {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮"),
      ),
      backgroundColor: Colors.white,
      //通过ConstrainedBox来确保Stack占满屏幕
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [

              OutlineButton(
                ///可用情况下的默认边框样式
                borderSide: BorderSide(width: 4.0, color: Colors.deepPurple[300], style: BorderStyle.solid),
                ///高亮，也就是按下时的边框的颜色
                highlightedBorderColor: Colors.deepPurple,
                ///不可用时的边框颜色
                disabledBorderColor:Colors.red ,
                child: Text("OutlineButton按钮"),
                ///点击事件
                onPressed: null,),
              SizedBox(height: 40,),
              OutlineButton(
                child: Text("OutlineButton按钮"),
                ///点击事件
                onPressed: () {  },),
              SizedBox(height: 40,),


            ],
          ),
        ),
      ),
    );
  }
}
