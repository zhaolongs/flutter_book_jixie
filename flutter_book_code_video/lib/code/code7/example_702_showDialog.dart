
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    home: Example702(),
  ));
}

/// 代码清单

class Example702 extends StatefulWidget {
  @override
  _Example702State createState() => _Example702State();
}

class _Example702State extends State<Example702> {
  int _count = 0;

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
            ElevatedButton(
              child: Text("showDialog  单选框"),
              onPressed: () {
                showDialogFunction();
              },
            ),
            ElevatedButton(
              child: Text("showDialog 单选框 "),
              onPressed: () {
                showDialogFunction2();
              },
            ),
            ElevatedButton(
              child: Text("showDialog 单选框 3 "),
              onPressed: () {
                showDialogFunction3();
              },
            ),
          ],
        ),
      ),
    );
  }

  ///代码清单 7-12
  ///lib/code/code7/example_702_showDialog.dart

  int _groupValue = 0;

  void showDialogFunction() async {
    bool isSelect = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("温馨提示"),
          content: Column(
            //内容包裹
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: Text("测试选项 A"),
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                  });
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
                },
                groupValue: _groupValue,
                value: 1,
              ),
            ],
          ),

          //底部按钮区域
          actions: <Widget>[
            TextButton(
              child: Text("再考虑一下"),
              onPressed: () {
                ////关闭 返回 false
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text("考虑好了"),
              onPressed: () {
                //关闭 返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    print("弹框关闭 $isSelect");
  }

  ///代码清单 7-15
  ///lib/code/code7/example_702_showDialog.dart
  void showDialogFunction2() async {
    bool isSelect = await showDialog<bool>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, mSetState) {
            return AlertDialog(
              title: Text("温馨提示"),
              content: Column(
                //内容包裹
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile(
                    title: Text("测试选项 A"),
                    onChanged: (value) {
                      mSetState(() {
                        _groupValue = value;
                      });
                    },
                    groupValue: _groupValue,
                    value: 0,
                  ),
                  RadioListTile(
                    title: Text("测试选项 B"),
                    onChanged: (value) {
                      mSetState(() {
                        _groupValue = value;
                      });
                    },
                    groupValue: _groupValue,
                    value: 1,
                  ),
                ],
              ),
              //底部按钮区域
              actions: <Widget>[
                TextButton(
                  child: Text("再考虑一下"),
                  onPressed: () {
                    ////关闭 返回 false
                    Navigator.of(context).pop(false);
                  },
                ),
                FlatButton(
                  child: Text("考虑好了"),
                  onPressed: () {
                    //关闭 返回true
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        );
      },
    );
    print("弹框关闭 $isSelect");
  }

  ///代码清单 7-13
  ///lib/code/code7/example_702_showDialog.dart
  void showDialogFunction3() async {
    bool isSelect = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("温馨提示"),
          //将显示的内容体单独的封装
          content: DialogRadioWidget(callBack: (int value) {
            _groupValue = value;
          },),
          //底部按钮区域
          actions: <Widget>[
            TextButton(
              child: Text("再考虑一下"),
              onPressed: () {
                ////关闭 返回 false
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text("考虑好了"),
              onPressed: () {
                //关闭 返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    print("弹框关闭 $isSelect");
  }
}
///代码清单 7-14
///lib/code/code7/example_702_showDialog.dart
class DialogRadioWidget extends StatefulWidget {
  final Function(int value) callBack;

  DialogRadioWidget({@required this.callBack});

  @override
  State<StatefulWidget> createState() {
    return _DialogRadioWidgetState();
  }
}

class _DialogRadioWidgetState extends State<DialogRadioWidget> {
  int _groupValue = 0;

  @override
  Widget build(BuildContext context) {
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
      ],
    );
  }
}
