import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//lib/code7/main_data7004.dart
///RaisedButton与FlatButto的.icon
class FlatButtonPage2 extends StatefulWidget {
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
              //lib/code7/main_data7004.dart
              ///RaisedButton与FlatButto的.icon
              RaisedButton.icon(
                  padding: EdgeInsets.all(10.0),
                  icon: Icon(Icons.message),
                  label: Text('RaisedButton'),
                  ///配制圆角矩形
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  onPressed: () => {}),

              SizedBox(height: 40,),

              FlatButton.icon(
                  icon: Icon(Icons.message),
                  label: Text('FlatButton'),
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  onPressed: () => {})
            ],
          ),
        ),
      ),
    );
  }
}
