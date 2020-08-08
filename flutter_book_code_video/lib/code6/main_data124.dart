import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code6/main_data124.dart
///  Container Transform Matrix4 4D 动态变换
class ContainerEntryPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  //记录x轴方向的缩放比例
  int x = 3;
  //记录y轴方向的缩放比例
  int y = 2;
  //记录z轴方向的缩放比例
  double z = 1;
  ///页面的
  buildBody1(){
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,children: [

        Transform(
          ///这里是配置的旋转功能
          transform: Matrix4(
            1,0,0,0,
            0,1,0,0,
            0,0,1,0,
            0,0,0,1,
          )..setEntry(x,y,z),
          ///这里是配置的旋转的参考中心点
          alignment: FractionalOffset.center,
          ///被矩阵操作的对象图形
          child: Container(
            height: 200.0,
            width: 200.0,
            decoration: new BoxDecoration(
              color: Colors.blue,
              // 环形渐变
              gradient: LinearGradient(
                ///渐变过渡的颜色体系
                colors: [Colors.blue, Colors.yellow, Colors.red],
              ),
            ),
          ),

        ),
        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: z,max:2,min:0,onChanged: (va){
          setState(() {
            z=va;
            print("当前x值 $z");
          });
        },),
        Text("在z轴方向缩放 当前缩放比例 ${z.toStringAsFixed(2)}"),



      ],),
    );
  }
}
