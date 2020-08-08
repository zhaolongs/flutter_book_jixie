import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//lib/code7/main_data7003.dart
///
class FlatButtonPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  double height = 5.0;
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
              //lib/code7/main_data7003.dart
              ///自定义RaisedButton的阴影效果
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            ///配置透明度为20%的蓝色
                            color: Colors.blue.withOpacity(0.2),
                            ///阴影的模糊高度
                            blurRadius: height,
                            ///阴影的偏移量
                            offset: Offset(0, height))
                      ]),
                  child: RaisedButton(
                      child: Text('RaisedButton'),
                      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 4.0, bottom: 4.0),
                      ///将原有的阴影去除
                      highlightElevation: 0.0,
                      onHighlightChanged: (state) {
                        setState(() {
                          height = (state) ? 10.0 : 5.0;
                        });
                      },
                      ///配置按钮的边框样式
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () => {})),

              SizedBox(height: 60,),
              FlatButton(
                child: Text("FlatButton按钮"),
                ///点击事件
                onPressed: () {  },),
              SizedBox(height: 40,),
              ///RaisedButton 与 FlatButton
              RaisedButton(
                child: Text("RaisedButton按钮"),
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
