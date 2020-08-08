import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/5/30.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class BoxFitBaseUsePage extends StatefulWidget {
  @override
  _ImageAssetsBaseUsePageState createState() => _ImageAssetsBaseUsePageState();
}

//lib/code/main_data9006.dart
class _ImageAssetsBaseUsePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图像混合模式"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: Text("当前  repeat: ${currentImageRepeat.toString()} \n  \t \t  \tboxfit:  ${currentBoxFit.toString()}"),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:  Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Image.asset(
                  "assets/images/banner_mang.png",
                  fit: currentBoxFit,
                  repeat: currentImageRepeat,
                  width: 200,
                    height: 100,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:  Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Image.asset(
                  "assets/images/2.0xx/app_icon.png",
                  fit: currentBoxFit,
                  repeat: currentImageRepeat,
                  width: 200,
                  height: 100,
                ),
              ),
              SizedBox(height: 40,),
              buildWrapFuntionc(),
            ],
          )),
    );
  }

  BoxFit currentBoxFit = BoxFit.none ;
  ImageRepeat currentImageRepeat = ImageRepeat.noRepeat;

  Widget buildWrapFuntionc(){

    List<Widget> list =[];
    for (int i = 0; i < 7; i++) {
      String text = "colorBurn";
      BoxFit selectBoxFit = BoxFit.none;
      switch(i) {
        case 0:
          selectBoxFit = BoxFit.none;
          text = "none";
          break;
        case 1:
          selectBoxFit = BoxFit.scaleDown;
          text = "scaleDown";
          break;
        case 2:
          selectBoxFit = BoxFit.fitHeight;
          text = "fitHeight";
          break;
        case 3:
          selectBoxFit = BoxFit.fitWidth;
          text = "fitWidth";
          break;
        case 4:
          selectBoxFit = BoxFit.cover;
          text = "cover";
          break;
        case 5:
          selectBoxFit = BoxFit.contain;
          text = "contain";
          break;
        case 6:
          selectBoxFit = BoxFit.fill;
          text = "fill";
          break;
      }
      list.add(Padding(child: RaisedButton(child: Text("$text" ,style: TextStyle(color: Colors.white),),onPressed: (){
        setState(() {
          currentBoxFit = selectBoxFit;
        });
      },),padding: EdgeInsets.all(10),));
    }

    for (int i = 0; i < 4; i++) {
      ImageRepeat imageRepeat = ImageRepeat.noRepeat;
      String text = "noRepeat";
      switch(i){
        case 0:
          imageRepeat = ImageRepeat.noRepeat;
          text = "noRepeat";
          break;
        case 1:
          imageRepeat = ImageRepeat.repeatY;
          text = "repeatY";
          break;
        case 2:
          imageRepeat = ImageRepeat.repeatX;
          text = "repeatX";
          break;
        case 3:
          imageRepeat = ImageRepeat.repeat;
          text = "repeat";
          break;

      }
      list.add(Padding(child: RaisedButton(child: Text("$text" ,style: TextStyle(color: Colors.white),),onPressed: (){
        setState(() {
          currentImageRepeat = imageRepeat;
          print("当前选择的模式 imageRepeat ${imageRepeat.toString()} currentBoxFit ${currentBoxFit.toString()}");
        });
      },),padding: EdgeInsets.all(10),));
    }

    return Expanded(child: SingleChildScrollView(child:  Wrap(children: list,),),);
  }
}