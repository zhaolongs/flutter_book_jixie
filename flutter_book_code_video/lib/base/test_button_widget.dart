import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/1.
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
///
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(home: TestPage(),));

}
class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends State<TestPage> {

  Color randColor=Colors.grey;
  Color lightRandColor=Colors.grey;
  @override
  Widget build(BuildContext context) {


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

              SizedBox(height: 40,),
              buildCustomButton(),


            ],
          )),
    );
  }

  Widget buildCustomButton(){
    return FlatButton(
      //按钮文字颜色
      textColor: Colors.white,
      //按钮禁用时的背景颜色
      disabledColor:Colors.grey,
      //按钮禁用时的文字颜色
      disabledTextColor: Colors.grey,
      //正常状态下的背景颜色
      color: Colors.blue,
      //按钮按下时的背景颜色
      highlightColor: Colors.blue[700],
      //按钮主题，默认是浅色主题
      colorBrightness: Brightness.dark,
      //外形
      splashColor: Colors.grey,
      // button 显示的文字
      child: Text("Submit"),
      //圆角边框
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      //按钮点击回调
      onPressed: () => {},
    );
  }


  Widget buildRaisedButton(){
    //它默认带有阴影和灰色背景。按下后，阴影会变大
    return RaisedButton(
      child: Text("RaisedButto"),
      onPressed: () => {}, ///点击事件
    );
  }
  //
  Widget buildFlatButton(){
    //FlatButton即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色：
    return FlatButton(
      child: Text("登录"),
      onPressed: () => {},
    );
  }
  Widget buildOutlineButton(){
    //OutlineButton默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)：
    return OutlineButton(
      child: Text("登录"),
      onPressed: () => {},
    );
  }

  Widget buildIconButton(){
    ///图标按钮
    return IconButton(
      ///图标
      icon: Icon(Icons.thumb_up),
      onPressed: () => {},
    );
  }


}