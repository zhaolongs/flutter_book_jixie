import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tag_layout/flutter_tag_layout.dart';

//lib/code10/main_data1002.dart
///   流式布局
class TextWarpMain1Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return buildBody2();
  }

  //lib/code10/main_data1002.dart
  /// Wrap 流式布局  文字标签
  ///页面的主体
  buildBody2() {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child:TextLayoutMainPage(
                ///文字标签集合
                buildTextLayoutData5(),
                ///可选参数 文字内边距
                padding: EdgeInsets.all(2),
                ///可选参数 文字外边距
                margins: EdgeInsets.only(left: 6, right: 4, top: 2, bottom: 2),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child:TextLayoutMainPage(
                ///文字标签集合
                buildTextLayoutData4(),
                ///可选参数 文字内边距
                padding: EdgeInsets.all(2),
                ///可选参数 文字外边距
                margins: EdgeInsets.only(left: 6, right: 4, top: 2, bottom: 2),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child:TextLayoutMainPage(
                ///文字标签集合
                buildTextLayoutData3(),
                ///可选参数 文字内边距
                padding: EdgeInsets.all(2),
                ///可选参数 文字外边距
                margins: EdgeInsets.only(left: 6, right: 4, top: 2, bottom: 2),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child:TextLayoutMainPage(
                ///文字标签集合
                buildTextLayoutData2(),
                ///可选参数 文字内边距
                padding: EdgeInsets.all(2),
                ///可选参数 文字外边距
                margins: EdgeInsets.only(left: 6, right: 4, top: 2, bottom: 2),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child:TextLayoutMainPage(
                ///文字标签集合
                buildTextLayoutData(),
                ///可选参数 文字内边距
                padding: EdgeInsets.all(2),
                ///可选参数 文字外边距
                margins: EdgeInsets.only(left: 6, right: 4, top: 2, bottom: 2),
              ),
            ),

          ],
        ),
      ),
    );
  }

  //lib/code10/main_data1002.dart
  /// Wrap 流式布局  文字标签
  ///页面的主体
  buildBody1() {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局"),
      ),
      body: Container(child: 
            ///文字标签流式布局
            TextLayoutMainPage(
                ///文字标签集合
                buildTextLayoutData(),
                ///可选参数 文字内边距
                padding: EdgeInsets.all(2),
                ///可选参数 文字外边距
                margins: EdgeInsets.only(left: 6,right: 4,top: 2,bottom: 2),),),
    );
  }


//lib/code10/main_data1002.dart
/// Wrap 流式布局 文本标签 模拟数据
  List<String> testTextList = [
    "测试",
    "这是什么","晨","来一下",
    "测试了","你好吗","码字",
    "勇敢的心","我来了","天气真好"
  ];
  ///构建流式布局文字标签使用的数据模型
 List<TextLayoutModel> buildTextLayoutData(){
   List<TextLayoutModel> textLayoutModel4List = [];
   for (int i = 0; i < testTextList.length; i++) {
     TextLayoutModel model =
           TextLayoutModel(
             ///文字内容
               "${testTextList[i]}",
               ///文字大小
               textSize: 12,
               ///背景颜色
               textBackgroundColor: Colors.blue,
               ///无背景
               backgroundModel: TextLayoutBackgroundModel.ovalBorder,
               ///文字颜色随机
               isTextColorRandom: true,
               ///无文字前Icon
               icon:null,
               ///显示文字前小圆点
               isShowCirPoint: true);

     textLayoutModel4List.add(model);
   }

   return textLayoutModel4List;
 }

  List<TextLayoutModel> buildTextLayoutData2(){
    List<TextLayoutModel> textLayoutModel4List = [];
    for (int i = 0; i < testTextList.length; i++) {
      TextLayoutModel model =
      TextLayoutModel(
        ///文字内容
          "${testTextList[i]}",
          ///文字大小
          textSize: 12,
          ///背景颜色
          textBackgroundColor: Colors.blue,
          ///无背景
          backgroundModel: TextLayoutBackgroundModel.ovalBorder,
          ///文字颜色随机
          isTextColorRandom: true,
          ///无文字前Icon
          icon:null,
          ///显示文字前小圆点
          isShowCirPoint: false);

      textLayoutModel4List.add(model);
    }

    return textLayoutModel4List;
  }

  List<TextLayoutModel> buildTextLayoutData3(){
    List<TextLayoutModel> textLayoutModel4List = [];
    for (int i = 0; i < testTextList.length; i++) {
      TextLayoutModel model =
      TextLayoutModel(
        ///文字内容
          "${testTextList[i]}",
          ///文字大小
          textSize: 12,
          ///背景颜色
          textBackgroundColor: Colors.blue,
          ///无背景
          backgroundModel: TextLayoutBackgroundModel.ovalBorder,
          ///文字颜色随机
          isTextColorRandom: true,
          ///无文字前Icon
          icon:Icon(Icons.mood,size: 20,color: Colors.blue,),
          ///显示文字前小圆点
          isShowCirPoint: false);

      textLayoutModel4List.add(model);
    }

    return textLayoutModel4List;
  }

  List<TextLayoutModel> buildTextLayoutData4(){
    List<TextLayoutModel> textLayoutModel4List = [];
    for (int i = 0; i < testTextList.length; i++) {
      TextLayoutModel model =
      TextLayoutModel(
        ///文字内容
          "${testTextList[i]}",
          ///文字大小
          textSize: 12,
          ///背景颜色
          textBackgroundColor: Colors.blue,
          ///无背景
          backgroundModel: TextLayoutBackgroundModel.ovalBorder,
          ///文字颜色随机
          isTextColorRandom: true,
          ///无文字前Icon
          icon:null,
          imag: Image.asset("assets/images/2.0x/friend_icon.png",width: 20,height: 20,),
          ///显示文字前小圆点
          isShowCirPoint: false);

      textLayoutModel4List.add(model);
    }

    return textLayoutModel4List;
  }

  List<TextLayoutModel> buildTextLayoutData5(){
    List<TextLayoutModel> textLayoutModel4List = [];
    for (int i = 0; i < testTextList.length; i++) {
      TextLayoutModel model =
      TextLayoutModel(
        ///文字内容
          "${testTextList[i]}",
          ///文字大小
          textSize: 12,
          textColor: Colors.white,
          ///背景颜色
          textBackgroundColor: Colors.blue[300],
          ///无背景
          backgroundModel: TextLayoutBackgroundModel.rrect,
          ///圆角背景的圆角大小配置
          backGroundRadius: 12,
          ///文字颜色随机
          isTextColorRandom: false,
          ///无文字前Icon
          icon:null,
          imag: null,
          ///显示文字前小圆点
          isShowCirPoint: false);

      textLayoutModel4List.add(model);
    }

    return textLayoutModel4List;
  }
}
