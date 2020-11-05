import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///

///代码清单 2-16
///lib/code/code2/example_scaffold_216_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookcode/demo/rich_text_tag.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example296(),
  ));
}

class Example296 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example296> {
  ///代码清单 2-96
  ///lib/code/code2/example_appbar_296_page.dart
  // 第一步 创建FocusNode对象实例
  FocusNode focusNode = FocusNode();
  // 输入框焦点事件的捕捉与监听
  @override
  void initState() {
    super.initState();

    //第二步 添加listener监听 当然这个可以没有
    //对应的TextField失去或者获取焦点都会回调此监听
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        print('得到焦点');
      } else {
        print('失去焦点');
      }
    });
  }
  ///代码清单 2-97
  ///lib/code/code2/example_appbar_296_page.dart
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      //手势识别 用来监听点击背景
      body: GestureDetector(
        onTap: (){
          //失去焦点
          //隐藏键盘
        },
        child: Container(
          margin: EdgeInsets.all(30.0),
          //线性布局竖起直方向的线性排列
          child: Column(
            children: [
              new TextField(
                //第三步引用 focusNode
                focusNode: focusNode,
                //边框样式设置
                decoration: InputDecoration(
                  labelText: "用户名",
                  //设置上下左右 都有边框
                  //设置四个角的弧度
                  border: OutlineInputBorder(
                    //设置边框四个角的弧度
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //第四步 页面销毁
  @override
  void dispose() {
    super.dispose();
    //释放
    focusNode.dispose();
  }


  //获取焦点
  void getFocusFunction(BuildContext context){
    FocusScope.of(context).requestFocus(focusNode);
  }

 //失去焦点
  void unFocusFunction(){
    focusNode.unfocus();
  }

 //隐藏键盘而不丢失文本字段焦点：
  void hideKeyBoard(){
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

}
