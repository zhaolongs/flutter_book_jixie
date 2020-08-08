import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code3/main_data86.dart
/// preIcon、prefix、suffixIcon、suffix的综合使用
class TextFieldPreIconPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {

  ///密码输入框文本控制器
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return buildMainBody();
  }

  Widget buildMainBody() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "登录",
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            children: [
              new TextField(
                //边框样式设置
                decoration: InputDecoration(
                  //输入文本前置的图标
                  prefixIcon: Icon(Icons.phone_iphone),
                  //配置prefixIcon图标的宽度与高度
                  prefixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 60,minWidth: 40),
                  //输入后置的图标
                  suffixIcon: Icon(Icons.arrow_right),
                  //配置suffixIcon图标的宽度与高度
                  suffixIconConstraints:  BoxConstraints(maxHeight: 30,maxWidth: 60,minWidth: 40),
                  labelText: "用户名",
                  ///设置上下左右 都有边框
                  ///设置四个角的弧度
                  border: OutlineInputBorder(
                    ///设置边框四个角的弧度
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              new TextField(
                controller:passwordController,
                //隐藏输入的文本
                obscureText: true,
                //最大可输入1行
                maxLines: 1,
                //边框样式设置
                decoration: InputDecoration(
                  //最前面的图标
                  prefix:Image(image: AssetImage("assets/images/2.0x/password_icon.png"),height: 24,),
                  suffix: InkWell(onTap: () {
                    ///点击清除密码输入框中的内容
                    passwordController.text="";
                  }, child: Icon(Icons.close,size: 19,),),
                  labelText: "密码",
                  //边框
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
