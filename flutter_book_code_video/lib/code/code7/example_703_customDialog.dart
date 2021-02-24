import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example703(),
  ));
}

/// 代码清单 7-15
///lib/code/code7/example_703_customDialog.dart
class Example703 extends StatefulWidget {
  @override
  _Example703State createState() => _Example703State();
}

class _Example703State extends State<Example703> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Dialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //点击一个按钮
            ElevatedButton(
              child: Text("显示自定义弹框"),
              onPressed: () {
                //以透明渐变的形式来打开新的页面
                NavigatorUtils.openPageByFade(
                  context,
                  CustomDialogWidget(
                    callBack: (int value) {},
                  ),
                  opaque: false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

///代码清单 7-16
///lib/code/code7/example_703_showDialog.dart
class CustomDialogWidget extends StatefulWidget {
  //点击单选框的回调
  final Function(int value) callBack;

  CustomDialogWidget({@required this.callBack});

  @override
  State<StatefulWidget> createState() {
    return _CustomDialogWidgetState();
  }
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  //当前单选框选择的值
  int _groupValue = 0;
  @override
  Widget build(BuildContext context) {
    //手势识别，点击空留区域 弹框消失功能
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        //背景透明
        backgroundColor: Color(0x30000000),
        body: Container(
          //填充当前视图
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          //层叠布局
          child: Stack(
            //子Widget居中
            alignment: Alignment.center,
            children: [
              //中间显示的白色圆角背景的选择区域
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    //圆角背景
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: buildColumn(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///代码清单 7-19
  ///lib/code/code7/example_703_showDialog.dart
  ///线性排列
  Column buildColumn(BuildContext context) {
    return Column(
      //内容包裹
      mainAxisSize: MainAxisSize.min,
      children: [
        RadioListTile(
          title: Text("测试选项 A"),
          onChanged: (value) {
            setState(() {
              _groupValue = value;
            });
            //回调
            widget.callBack(_groupValue);
          },
          groupValue: _groupValue,
          value: 0,
        ),
        RadioListTile(
          title: Text("测试选项 B"),
          onChanged: (value) {
            setState(() {
              _groupValue = value;
            });
            widget.callBack(_groupValue);
          },
          groupValue: _groupValue,
          value: 1,
        ),
        //分割线
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          height: 1,
          color: Colors.grey[200],
        ),
        //关闭按钮
        Container(
          child: CloseButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        )
      ],
    );
  }
}
