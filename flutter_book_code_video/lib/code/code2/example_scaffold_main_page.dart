import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

///代码清单 2-16
///lib/code/code2/example_scaffold_Main_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutterbookcode/base/list/colors.dart';
import 'package:flutterbookcode/base/list/header_icon.dart';
import 'package:flutterbookcode/base/list/list_title.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'example_217_appbar_page.dart';
import 'example_218_appbar_page.dart';
import 'example_219_appbar_page.dart';
import 'example_237_button_page.dart';
import 'example_234_container_page.dart';
import 'example_235_container_page.dart';
import 'example_236_container_page.dart';
import 'example_233_container_page.dart';
import 'example_207_scaffold_page.dart';
import 'example_208_scaffold_page.dart';
import 'example_209_scaffold_page.dart';
import 'example_210_scaffold_page.dart';
import 'example_211_scaffold_page.dart';
import 'example_212_scaffold_page.dart';
import 'example_213_scaffold_page.dart';
import 'example_214_scaffold_page.dart';
import 'example_215_scaffold_page.dart';
import 'example_216_appbar_page.dart';
import 'example_220_text_page.dart';
import 'example_221_text_page.dart';
import 'example_222_text_page.dart';
import 'example_223_text_page.dart';
import 'example_224_text_page.dart';
import 'example_225_text_page.dart';
import 'example_226_text_page.dart';
import 'example_227_textfield_page.dart';
import 'example_228_textfield_page.dart';
import 'example_229_textfield_page.dart';
import 'example_230_textfield_page.dart';
import 'example_231_textfield_page.dart';
import 'example_232_textfield_page.dart';
import 'example_238_button_page.dart';
import 'example_239_button_page.dart';
import 'example_240_button_page.dart';

///Scaffold 组件使用目录
//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: ExampleMain(),
  ));
}

class ExampleMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<ExampleMain> {
  List<Map<String, dynamic>> list = [
    {"title": "Scaffold 的基本使用", "page": Example207(),"type":1},
    {"title": "Scaffold 的 常用页面 ", "page": Example208(),"type":1},
    {"title": "Scaffold  FAB 的基本使用 ", "page": Example209(),"type":1},
    {"title": "Scaffold FAB mini 类型 ", "page": Example210(),"type":1},
    {"title": "Scaffold 自定义该当触发侧拉页面", "page": Example211(),"type":1},
    {"title": "Scaffold bottomNavigationBar配制底部导航栏菜单", "page": Example212(),"type":1},
    {"title": "Scaffold 底部导航栏 结合 List来切换页面", "page": Example213(),"type":1},
    {"title": "Scaffold 底部导航栏与 TabBarView 结合", "page": Example214(),"type":1},
    {"title": "Scaffold 底部导航栏与 类似闲鱼", "page": Example215(),"type":1},
    {"title": "AppBar 的基本使用", "page": Example216(),"type":2},
    {"title": "AppBar 可滑动的标签栏", "page": Example217(),"type":2},
    {"title": "AppBar 常用左右切换", "page": Example218(),"type":2},
    {"title": "AppBar bottom配置任意的Widget", "page": Example219(),"type":2},
    {"title": "Text 文本对齐", "page": Example220(),"type":3},

    {"title": "Text TextStyle的基本使用代码如下", "page": Example221(),"type":3},
    {"title": "Text TextStyle的 下划线", "page": Example222(),"type":3},
    {"title": "Text 自定义字体", "page": Example223(),"type":3},
    {"title": "Text AnimatedDefaultTextStyle", "page": Example224(),"type":3},

    {"title": "Text RichText", "page": Example225(),"type":3},
    {"title": "Text RichTextTag 搜索内容高亮", "page": Example226(),"type":3},
    {"title": "TextField 文本输入框的基本使用", "page": Example227(),"type":4},
    {"title": "TextField 文本输入框 的边框样式设置", "page": Example228(),"type":4},
    {"title": "TextField 文本输入框 的提示文本设置", "page": Example229(),"type":4},
    {"title": "TextField 文本输入框 登录提示", "page": Example230(),"type":4},
    {"title": "TextField 文本输入框 控制器", "page": Example294(),"type":4},
    {"title": "TextField 文本输入框 焦点控制", "page": Example232(),"type":4},

    {"title": "Container 基本使用", "page": Example233(),"type":5},

    {"title": "Container BoxDecoration ", "page": Example234(),"type":5},
    {"title": "Container ShapeDecoration ", "page": Example235(),"type":5},
    {"title": "Container 自定义ShapeBorder ", "page": Example236(),"type":5},
    {"title": "Button的基本使用 ", "page": Example237(),"type":6},
    {"title": "Button  ", "page": Example238(),"type":6},
    {"title": "Button 加载进度的按钮", "page": Example239(),"type":6},
    {"title": "Button AnimatedButton", "page": Example240(),"type":6},


  ];

  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("第二章节基础组件"),
      ),
      //页面的主内容区
      //可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: Stack(children: [
        Image.asset(
          "assets/images/3.0x/common_bg2.png",
          fit: BoxFit.fill,
        ),
        buildCustomScrollView(context)
      ]),
    );
  }

  CustomScrollView buildCustomScrollView(BuildContext context) {
    List<Widget> childList = [];
    for (var i = 0; i < list.length; i++) {
      Map<String, dynamic> item = list[i];
      childList.add(
        CommonListTile(
          title: item["title"],
          main: InkWell(
            child: Container(
             alignment: Alignment.center,
              width: double.infinity,
              height: 44,
              child: Text(
                "点击查看详情",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {
              NavigatorUtils.pushPage(context, item["page"]);
            },
          ),
          icon: RoundedCornerIcon(
            iconData: CupertinoIcons.battery_25_percent,
            gradient: BrandColors.gradient2,
          ),
        ),
      );
    }
    return CustomScrollView(
      slivers: childList,
    );
  }
}
