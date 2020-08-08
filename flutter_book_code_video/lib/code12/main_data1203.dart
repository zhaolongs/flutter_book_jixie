import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/6.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class RadioListTitlePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1203.dart
class _TestPageState extends State<RadioListTitlePage> {
  ///默认选中的单选框的值
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RadioListTitle组件"),),
      body: buildRadioListTilte2(),
    );
  }

  buildRadioListTilteColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.all(10),child: Text("请选择一个说法正确的答案：",style: TextStyle(fontSize: 16),),),
        RadioListTile<int>(
          ///主标题区域
          title: Text('A'),
          ///副标题
          subtitle: Text('Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。'),
          ///配制Radio的位置
          controlAffinity :ListTileControlAffinity.leading,
          ///当前Radio对应的值
          value: 0,
          groupValue: groupValue,
          isThreeLine: false,
          ///点击事件回调
          onChanged: (v) {
            setState(() {
              this.groupValue = v;
            });
          },
        ),
        RadioListTile<int>(
          title: Text('B'),
          value: 1,
          groupValue: groupValue,
          isThreeLine: false,
          subtitle: Text('Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。'),
          onChanged: (v) {
            setState(() {
              this.groupValue = v;
            });
          },
        )
      ],
    );
  }

  //lib/code/main_data1203.dart
  ///RadioListTile 的基本使用
  buildRadioListTilte() {
    return  RadioListTile<int>(
      ///主标题区域
      title: Container(color: Colors.grey,height: 44,),
      ///副标题区域
      subtitle: Container(color: Colors.deepPurple,height: 44),
      ///配制Radio的位置
      controlAffinity :ListTileControlAffinity.platform,
      ///当前Radio对应的值
      value: 0,
      groupValue: groupValue,
      ///点击事件回调
      onChanged: (v) {
        setState(() {
          this.groupValue = v;
        });
      },
    );
  }
  //lib/code/main_data1203.dart
  ///RadioListTile 的基本使用
  buildRadioListTilte2() {
    return  RadioListTile<int>(
      ///主标题区域
      title: Text("Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。"),
      isThreeLine: false,
      subtitle: Text("Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面"),
      ///配制Radio的位置
      controlAffinity :ListTileControlAffinity.platform,
      ///当前Radio对应的值
      value: 0,
      groupValue: groupValue,
      ///点击事件回调
      onChanged: (v) {
        setState(() {
          this.groupValue = v;
        });
      },
    );
  }
}
