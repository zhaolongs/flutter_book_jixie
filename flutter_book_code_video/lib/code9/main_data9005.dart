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
class ImageColorBlendMode extends StatefulWidget {
  @override
  _ImageAssetsBaseUsePageState createState() => _ImageAssetsBaseUsePageState();
}

//lib/code/main_data9005.dart
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
                child: Text("混色后的图"),
              ),
              Image.asset(
                "assets/images/banner_mang.png",
                color:currentColor,
                colorBlendMode: currentBlendModel,
              ),

//              Image.asset(
//                "assets/images/banner_mang.png",
//                color:Colors.grey,
//                colorBlendMode: BlendMode.colorBurn,
//              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Text("原图"),
              ),
              Image.asset(
                "assets/images/banner_mang.png",
              ),

              SizedBox(height: 40,),
              buildWrapFuntionc(),
            ],
          )),
    );
  }

  BlendMode currentBlendModel = BlendMode.colorBurn ;
  Color currentColor = Colors.transparent;
  Widget buildWrapFuntionc(){

    List<Widget> list =[];
    for (int i = 0; i < 4; i++) {
      String text = "colorBurn";
      Color selectColor = Colors.transparent;
      switch(i) {
        case 0:
          selectColor = Colors.grey;
          text = "grey";
          break;
        case 1:
          selectColor = Colors.black;
          text = "black";
          break;
        case 2:
          selectColor = Colors.blue;
          text = "blue";
          break;
        case 3:
          selectColor = Colors.red;
          text = "red";
          break;
      }
      list.add(Padding(child: RaisedButton(child: Text("$text" ,style: TextStyle(color: Colors.white),),onPressed: (){
        setState(() {
          currentColor = selectColor;
        });
      },),padding: EdgeInsets.all(10),));
    }
    
    for (int i = 0; i < 30; i++) {
      BlendMode blendMode = BlendMode.colorBurn;
      String text = "colorBurn";
      switch(i){
        case 0:
           blendMode = BlendMode.colorBurn;
           text = "colorBurn";
          break;
        case 1:
          blendMode = BlendMode.srcOver;
          text = "srcOver";
          break;
        case 2:
          blendMode = BlendMode.dstOver;
          text = "dstOver";
          break;
        case 3:
          blendMode = BlendMode.srcIn;
          text = "srcIn";
          break;
        case 4:
          blendMode = BlendMode.dstIn;
          text = "dstIn";
          break;
        case 5:
          blendMode = BlendMode.srcOut;
          text = "srcOut";
          break;
        case 6:
          blendMode = BlendMode.dstOut;
          text = "dstOut";
          break;
        case 7:
          blendMode = BlendMode.srcATop;
          text = "srcATop";
          break;
        case 8:
          blendMode = BlendMode.dstATop;
          text = "dstATop";
          break;
        case 9:
          blendMode = BlendMode.xor;
          text = "xor";
          break;
        case 10:
          blendMode = BlendMode.plus;
          text = "plus";
          break;
        case 11:
          blendMode = BlendMode.modulate;
          text = "modulate";
          break;
        case 12:
          blendMode = BlendMode.screen;
          text = "screen";
          break;
        case 13:
          blendMode = BlendMode.overlay;
          text = "overlay";
          break;
        case 14:
          blendMode = BlendMode.darken;
          text = "darken";
          break;
        case 15:
          blendMode = BlendMode.lighten;
          text = "lighten";
          break;
        case 16:
          blendMode = BlendMode.colorDodge;
          text = "colorDodge";
          break;
        case 17:
          blendMode = BlendMode.colorBurn;
          text = "colorBurn";
          break;
        case 18:
          blendMode = BlendMode.hardLight;
          text = "hardLight";
          break;
        case 19:
          blendMode = BlendMode.softLight;
          text = "softLight";
          break;
        case 20:
          blendMode = BlendMode.difference;
          text = "difference";
          break;
        case 21:
          blendMode = BlendMode.exclusion;
          text = "exclusion";
          break;
        case 22:
          blendMode = BlendMode.multiply;
          text = "multiply";
          break;
        case 23:
          blendMode = BlendMode.hue;
          text = "hue";
          break;
        case 24:
          blendMode = BlendMode.saturation;
          text = "saturation";
          break;
        case 25:
          blendMode = BlendMode.color;
          text = "color";
          break;
        case 26:
          blendMode = BlendMode.luminosity;
          text = "luminosity";
          break;
        case 27:
          blendMode = BlendMode.src;
          text = "src";
          break;
        case 28:
          blendMode = BlendMode.dst;
          text = "dst";
          break;
        case 29:
          blendMode = BlendMode.clear;
          text = "clear";
          break;
      }
      list.add(Padding(child: RaisedButton(child: Text("$text" ,style: TextStyle(color: Colors.white),),onPressed: (){
        setState(() {
          currentBlendModel = blendMode;
          print("当前选择的模式 ${currentBlendModel.toString()} 颜色 ${currentColor.toString()}");
        });
      },),padding: EdgeInsets.all(10),));
    }

    return Expanded(child: SingleChildScrollView(child:  Wrap(children: list,),),);
  }
}
