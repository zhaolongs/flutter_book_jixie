import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data401.dart';
import 'main_data402.dart';
import 'main_data403.dart';
import 'main_data404.dart';

class TextMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<TextMainPage> {
  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Text组件"),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(context),
        ));
  }

  buildBodyFunction(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: bluldLeftWidget(context),
              ),
              margin: EdgeInsets.only(right: 20),
            ),
          ),
//     Expanded(child: Container(child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget2(context),),),)
        ],
      ),
    );
  }

  bluldLeftWidget(BuildContext context) {
    return [
      buildContainerAndClick("文本标签", () {
        NavigatorUtils.pushPage(context, TextTagPage());
      }),
      buildContainerAndClick("文本标签与流式布局", () {
        NavigatorUtils.pushPage(context, TextWarpTagPage());
      }),
      buildContainerAndClick("富文本RichText使用案例", () {
        NavigatorUtils.pushPage(context, RichTextTagPage());
      }),
      buildContainerAndClick("样式组件AnimatedDefaultTextStyle的使用分析", () {
        NavigatorUtils.pushPage(context, AnimatedTextStylePage());
      }),
    ];
  }

  bluldLeftWidget2(BuildContext context) {
    return [];
  }
}
