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
///lib/code/code2/example_scaffold_Main_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookcode/base/list/brand_table.dart';
import 'package:flutterbookcode/base/list/colors.dart';
import 'package:flutterbookcode/base/list/header_icon.dart';
import 'package:flutterbookcode/base/list/list_title.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'example_scaffold_216_page.dart';
import 'example_scaffold_217_page.dart';
import 'example_scaffold_219_page.dart';
import 'example_scaffold_220_page.dart';
import 'example_scaffold_222_page.dart';
import 'example_scaffold_224_page.dart';
import 'example_scaffold_225_page.dart';
import 'example_scaffold_228_page.dart';
import 'example_scaffold_229_page.dart';
import 'example_scaffold_231_page.dart';
import 'example_scaffold_235_page.dart';
import 'example_scaffold_237_page.dart';

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

  List<Map<String,dynamic>> list = [
    {
      "title":"Scaffold的基本使用",
      "page" :Example216()
    },
    {
      "title":"Scaffold的 常用页面 ",
      "page" :Example217()
    },
    {
      "title":"FAB 的基本使用 ",
      "page" :Example219()
    },
    {
      "title":"FAB mini 类型 ",
      "page" :Example220()
    },
    {
      "title":"FAB extended 类型 ",
      "page" :Example222()
    },
    {
      "title":"FAB 的常用属性 ",
      "page" :Example224()
    },
    {
      "title":"侧拉页面的配置使用 ",
      "page" :Example225()
    },    {
      "title":"UserAccountsDrawerHeader组件",
      "page" :Example228()
    },

    {
      "title":"自定义该当触发侧拉页面",
      "page" :Example229()
    },

    {
      "title":"bottomNavigationBar配制底部导航栏菜单",
      "page" :Example231()
    },
    {
      "title":"底部导航栏 结合 List来切换页面",
      "page" :Example235()
    },

    {
      "title":"底部导航栏与 TabBarView 结合",
      "page" :Example237()
    },



  ];

  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(title: Text("Scaffold使用目录"),),
      //页面的主内容区
      //可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: Stack(children: [Image.asset(
        "assets/images/3.0x/common_bg.png",
        fit: BoxFit.fill,
      ), buildCustomScrollView(context)]),);
  }

  CustomScrollView buildCustomScrollView(BuildContext context) {
    List<Widget> childList=[];
    for (var i = 0; i < list.length; i++) {
      Map<String,dynamic> item  = list[i];
      childList.add( CommonListTile(
        title: item["title"],
        main:InkWell(child: Container(width: double.infinity,height: 44,),onTap: (){
          NavigatorUtils.pushPage(context, item["page"]);
        },),
        icon: RoundedCornerIcon(
          iconData: CupertinoIcons.battery_25_percent,
          gradient: BrandColors.gradient2,
        ),
      ),);
    }
    return CustomScrollView(
      slivers: childList,
    );
  }
}
