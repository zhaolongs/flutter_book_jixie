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
class RadioBaseUsePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1201.dart
class _TestPageState extends State<RadioBaseUsePage> {


  @override
  Widget build(BuildContext context) {

    if(globalKey.currentContext!=null&&globalKey.currentContext.findRenderObject()!=null){
      Size size = globalKey.currentContext.findRenderObject().paintBounds.size;
      print("${size.toString()}");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.white,


      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              ///buildRadioGroupColumnWidget(),
              /// buildRadioGroupRowWidget(),
              ///buildRadioGroupWidget(),
              buildRadioUseWidget(),
            ],
          )),
    );
  }

  GlobalKey globalKey = new GlobalKey();
  //lib/code/main_data1201.dart
  ///默认选中的单选框的值
  int groupValue = 0;
  ///单选框的基本使用
  Radio buildRadioUseWidget() {


    return Radio(
      key:globalKey,
       visualDensity: VisualDensity(horizontal: -4,vertical: -4),
      materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
      ///此单选框绑定的值 必选参数
      value: 0,
      ///当前组中这选定的值  必选参数
      groupValue: groupValue,
      ///点击状态改变时的回调 必选参数
      onChanged: (v) {
        setState(() {
          this.groupValue = v;
        });
      },
    );
  }

  //lib/code/main_data1201.dart
  ///单选框的成组使用
  Row buildRadioGroupWidget() {
    return Row(children: [
      Radio(
        ///此单选框绑定的值 必选参数
        value: 0,
        ///当前组中这选定的值  必选参数
        groupValue: groupValue,
        ///点击状态改变时的回调 必选参数
        onChanged: (v) {
          setState(() {
            this.groupValue = v;
          });
        },
      ),
      Radio(
        ///此单选框绑定的值 必选参数
        value: 1,
        ///当前组中这选定的值  必选参数
        groupValue: groupValue,
        ///点击状态改变时的回调 必选参数
        onChanged: (v) {
          setState(() {
            this.groupValue = v;
          });
        },
      ),
      Radio(
        ///此单选框绑定的值 必选参数
        value: 2,
        ///当前组中这选定的值  必选参数
        groupValue: groupValue,
        ///点击状态改变时的回调 必选参数
        onChanged: (v) {
          setState(() {
            this.groupValue = v;
          });
        },
      )
    ],);
  }

  //lib/code/main_data1201.dart
  ///单选框的成组使用
  Row buildRadioGroupRowWidget() {
    return Row(
      children: [
        Row(
          ///包裹子布局
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio(
              ///此单选框绑定的值 必选参数
              value: 0,
              ///当前组中这选定的值  必选参数
              groupValue: groupValue,
              ///点击状态改变时的回调 必选参数
              onChanged: (v) {
                setState(() {
                  this.groupValue = v;
                });
              },
            ),
            Text("语文")
          ],
        ),
        Row(
          ///包裹子布局
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio(
              ///此单选框绑定的值 必选参数
              value: 1,
              ///当前组中这选定的值  必选参数
              groupValue: groupValue,
              ///点击状态改变时的回调 必选参数
              onChanged: (v) {
                setState(() {
                  this.groupValue = v;
                });
              },
            ),
            Text("数学")
          ],
        ),
        Row(
          ///包裹子布局
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio(
              ///此单选框绑定的值 必选参数
              value: 2,
              ///当前组中这选定的值  必选参数
              groupValue: groupValue,
              ///点击状态改变时的回调 必选参数
              onChanged: (v) {
                setState(() {
                  this.groupValue = v;
                });
              },
            ),
            Text("英语")
          ],
        ),
      ],
    );
  }
  //lib/code/main_data1201.dart
  ///单选框的成组使用
  Row buildRadioGroupColumnWidget() {
    return Row(
      children: [
        Column(
          ///包裹子布局
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio(
              ///此单选框绑定的值 必选参数
              value: 0,
              ///当前组中这选定的值  必选参数
              groupValue: groupValue,
              ///点击状态改变时的回调 必选参数
              onChanged: (v) {
                setState(() {
                  this.groupValue = v;
                });
              },
            ),
            Text("语文")
          ],
        ),
        Column(
          ///包裹子布局
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio(
              ///此单选框绑定的值 必选参数
              value: 1,
              ///当前组中这选定的值  必选参数
              groupValue: groupValue,
              ///点击状态改变时的回调 必选参数
              onChanged: (v) {
                setState(() {
                  this.groupValue = v;
                });
              },
            ),
            Text("数学")
          ],
        ),
        Column(
          ///包裹子布局
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio(
              ///此单选框绑定的值 必选参数
              value: 2,
              ///当前组中这选定的值  必选参数
              groupValue: groupValue,
              ///点击状态改变时的回调 必选参数
              onChanged: (v) {
                setState(() {
                  this.groupValue = v;
                });
              },
            ),
            Text("英语")
          ],
        ),
      ],
    );
  }
}
