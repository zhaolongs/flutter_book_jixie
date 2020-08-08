import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/demo/rich_text_tag.dart';
//import 'package:flutter_tag_layout/flutter_tag_layout.dart';

/// lib/code4/main_data401.dart
class RichTextTagPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}
class _FirstPageState extends State<RichTextTagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("文本标签"),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          ///参数一为显示的文本段落
          ///参数二为筛选的关键词
          child:  RichTextTag("adadfafeaaefagcvae32455aa565eza","a"),
        ));
  }
}





