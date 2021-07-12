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
import 'package:flutter/painting.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example237(),
  ));
}


class Example237 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example237> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮"),
      ),
      //手势识别 用来监听点击背景
      body: Container(
        padding: EdgeInsets.all(20),
        //容器的高度
        width: double.infinity,
        child: PopupMenuButton<String>(
          //设置小弹框的偏移量，x轴方向的偏移量为0，y轴方向的偏移量为向下偏移为100
            offset: Offset(0, 0),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                child: Text("文本一"),
                value: "value1",
              ),
              new PopupMenuDivider(height: 1.0),
              PopupMenuItem<String>(
                child: Text("文本二"),
                value: "value2",
              ),
              new PopupMenuDivider(height: 1.0),
              PopupMenuItem<String>(
                child: Text("文本三"),
                value: "value3",
              ),
            ],
            //点击子菜单的回调
            onSelected: (String value) {})
        ,
      ),
    );
  }

  Widget buildShowAllButton(){
    return SingleChildScrollView(
      child: Column(
        children: [
          dividerPopMenu(),
          SizedBox(
            height: 44,
          ),
          buildOutlinedButton(),
          SizedBox(
            height: 44,
          ),
          buildElevatedButton(),
          SizedBox(
            height: 44,
          ),
          buildTextButton(),
          SizedBox(
            height: 44,
          ),
          buildRaisedButton(),
          SizedBox(
            height: 44,
          ),
          buildFlatButton(),
          SizedBox(
            height: 44,
          ),
          buildOutlineButton(),
          SizedBox(
            height: 44,
          ),
          buildMaterialButton4(),
          SizedBox(
            height: 44,
          ),
          buildMaterialButton3(),
          SizedBox(
            height: 44,
          ),
          buildMaterialButton2(),
          SizedBox(
            height: 44,
          ),
          buildMaterialButton(),
        ],
      ),
    );
  }

  ///代码清单 2-38 Material Design风格按钮的基本使用
  ///lib/code/code2/example_237_button_page.dart
  ///Material Design风格按钮的基本使用
  Widget buildMaterialButton() {
    return MaterialButton(
      //按钮上显示的文字
      child: Text('登录'),
      //按钮的点击事件
      onPressed: () {
        print("点击了按钮");
      },
    );
  }

  ///代码清单 2-70
  ///lib/code/code2/example_237_button_page.dart
  ///Material Design风格按钮的基本使用
  Widget buildMaterialButton2() {
    return MaterialButton(
      //按钮的背景
      color: Colors.blue,
      //按钮上显示的文字
      child: Text('登录'),
      //配制按钮上文本的颜色
      textColor: Colors.deepOrange,
      //未设置点击时的背景颜色 也就是当onPressed: null,时显示这个颜色配置
      disabledColor: Colors.yellow,
      //按钮点击下的颜色
      highlightColor: Colors.deepPurple,
      //水波纹的颜色
      splashColor: Colors.green,
      //按钮的阴影
      elevation: 10,
      //按钮按下时的阴影高度
      highlightElevation: 20,
      //未设置点击时的阴影高度
      disabledElevation: 5.0,
      //按钮的点击事件
      onPressed: () {
        print("点击了按钮");
      },
    );
  }

  ///代码清单 2-71
  ///lib/code/code2/example_237_button_page.dart
  ///按钮的事件回调
  Widget buildMaterialButton3() {
    return MaterialButton(
        //按钮上显示的文字
        child: Text('登录'),
        //按钮的点击事件
        onPressed: () {
          print("点击了按钮");
        },
        //按钮按下时回调 value = true
        //按钮抬起时回调 value = false
        //要先于 onPressed
        onHighlightChanged: (value) {
          print("按钮点击 Hight $value");
        },
        //按钮的长按事件
        onLongPress: () {
          print("长按按钮");
        });
  }

  ///代码清单 2-72
  ///lib/code/code2/example_237_button_page.dart
  /// shape使用分析
  Widget buildMaterialButton4() {
    return MaterialButton(
      //按钮上显示的文字
      child: Text('登录'),
      //按钮的点击事件
      onPressed: () {
        print("点击了按钮");
      },
      //同时配置四个边框
      shape: Border.all(
          //边框的颜色
          color: Colors.deepOrange,
          //边框的宽度
          width: 2.5,
          // 取值为 BorderStyle.solid 表示使用这个边框样式配置
          // 取值为 BorderStyle.none 表示不使用这个边框样式配置
          style: BorderStyle.solid),
    );
  }

  ///代码清单 2-73
  ///lib/code/code2/example_237_button_page.dart
  /// shape使用分析 RoundedRectangleBorder 创建圆角矩形边框
  Widget buildMaterialButton7() {
    return MaterialButton(
      //按钮上显示的文字
      child: Text('登录'),

      // 用来设置圆角矩形边框
      shape: RoundedRectangleBorder(
          //边框样式
          side: BorderSide(
              color: Colors.deepOrange, width: 2.5, style: BorderStyle.solid),
          //边框的圆角
          borderRadius: BorderRadius.all(Radius.circular(20))),
      onPressed: () {},
    );
  }

  ///代码清单 2-74
  ///lib/code/code2/example_237_button_page.dart
  /// shape使用分析 CircleBorder 用来设置圆形边框
  Widget  buildMaterialButton8() {
    return MaterialButton(
      //按钮上显示的文字
      child: Text('登录'),
      //按钮的点击事件
      onPressed: () {
        print("点击了按钮");
      },
      // 用来设置圆形边框
      shape: CircleBorder(side: BorderSide(width: 2, color: Colors.red)),
    );
  }

  ///代码清单 2-75
  ///lib/code/code2/example_237_button_page.dart
  Widget buildMaterialButton9() {
    return MaterialButton(
      //按钮上显示的文字
      child: Text('登录'),
      //按钮的点击事件
      onPressed: () {
        print("点击了按钮");
      },
      // 椭圆形边框
      shape: StadiumBorder(side: BorderSide(width: 2, color: Colors.red)),
    );
  }

  ///代码清单 2-76
  ///lib/code/code2/example_237_button_page.dart
  /// shape使用分析  BeveledRectangleBorder设置 多边形
  Widget buildMaterialButton10() {
    return MaterialButton(
        //按钮上显示的文字
        child: Text('登录'),
        // 设置 多边形边框
        shape: BeveledRectangleBorder(
            //边框样式
            side: BorderSide(width: 2, color: Colors.red),
            //边框角度
            borderRadius: BorderRadius.all(Radius.circular(10))));
  }

  ///代码清单 2-77
  ///lib/code/code2/example_237_button_page.dart
  Widget buildRaisedButton() {
    return RaisedButton(
      child: Text("RaisedButton按钮"),
      //点击事件
      onPressed: () {},
    );
  }

  ///代码清单 2-78
  ///lib/code/code2/example_237_button_page.dart
  Widget buildFlatButton() {
    return FlatButton(
      child: Text("FlatButton按钮"),
      //点击事件
      onPressed: () {},
    );
  }

  ///代码清单 2-79
  ///lib/code/code2/example_237_button_page.dart
  Widget buildOutlineButton() {
    return RaisedButton(
      child: Text("OutlineButton按钮"),
      //点击事件
      onPressed: () {},
    );
  }

  ///代码清单 2-80
  ///lib/code/code2/example_237_button_page.dart
  Widget buildTextButton() {
    return TextButton(
      child: Text("TextButton按钮"),
      //点击事件
      onPressed: () {},
    );
  }

  ///代码清单 2-81
  ///lib/code/code2/example_237_button_page.dart
  Widget buildElevatedButton() {
    return ElevatedButton(
      child: Text("ElevatedButton 按钮"),
      //点击事件
      onPressed: () {},
    );
  }
  ///代码清单 2-82
  Widget buildOutlinedButton() {
    return OutlinedButton(
      child: Text("OutlinedButton 按钮"),
      //点击事件
      onPressed: () {},
    );
  }
  ///代码清单 2-83
  Widget buildBackButton() {
    return BackButton(
      //配置按钮返回箭头的颜色
      color: Colors.blue,
      //返回按钮的点击事件
      onPressed: () {},
    );
  }
  ///代码清单 2-39 向下弹出框按钮
  ///lib/code/code2/example_237_button_page.dart
  Widget dividerPopMenu() {
    return new PopupMenuButton<String>(
        //设置小弹框的偏移量
        //在这里是x轴方向的偏移量为0
        //y轴方向的偏移量为向下偏移为100
        offset: Offset(0, 100),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                child: Text("文本一"),
                value: "value1",
              ),
              new PopupMenuDivider(height: 1.0),
              PopupMenuItem<String>(
                child: Text("文本二"),
                value: "value2",
              ),
              new PopupMenuDivider(height: 1.0),
              PopupMenuItem<String>(
                child: Text("文本三"),
                value: "value3",
              ),
            ],
        //点击子菜单的回调
        onSelected: (String value) {});
  }
}
