import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/26.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/demo/rich_text_tag.dart
///富文本标签，关键词高亮显示
class RichTextTag extends StatelessWidget{

  ///显示的内容文本
  String contentText;
  ///关键词
  String keyWordText;

  RichTextTag(this.contentText, this.keyWordText);

  @override
  Widget build(BuildContext context) {
    return buildKeyWordRichText(contentText,keyWordText);
  }

  ///包含关键词的内容高亮显示
  ///[title] 内容体
  ///[keyWord] 关键词
  buildKeyWordRichText(String title, String keyWord) {
    List<TextSpan> spans = [];
    spans.addAll(keyWordSpan(title, keyWord));
    return RichText(text: TextSpan(children: spans));
  }
  keyWordSpan(String word, String keyWord) {
    List<TextSpan> spans = [];
    if (word == null || word.length == 0) return spans;
    ///按关键词分隔
    List<String> strings = word.split(keyWord);
    for (int i = 0; i < strings.length; i++) {
      ///关键词部分
      if ((i + 1) % 2 == 0) {
        spans
            .add(TextSpan(text: keyWord, style: TextStyle(color: Colors.blue)));
      }
      ///普通部分
      String value = strings[i];
      if (value != null && value.length > 0) {
        spans.add(TextSpan(text: value, style: TextStyle(color: Colors.grey)));
      }
    }
    return spans;
  }
}