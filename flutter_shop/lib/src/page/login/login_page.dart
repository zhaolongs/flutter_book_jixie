import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/auth/face_model.dart';
import 'package:flutter_shop/src/common/custom_oval_button.dart';
import 'package:flutter_shop/src/page/login/login_bottom_widget.dart';
import 'package:local_auth/local_auth.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/10/31.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///

///启动函数
void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: LoginPage(),
    );
  }
}


///登录页面
///lib/src/page/login/login_page.dart
//定义登录页面
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

/// FaceModel 是封装的指纹识别功能
class _LoginPageState extends State<LoginPage> with FaceModel {
  //用户协议 富文本中使用的手势识别
  TapGestureRecognizer _gestureRecognizer;

  //隐私协议 富文本中使用的手势识别
  TapGestureRecognizer _gestureRecognizer2;

  @override
  void initState() {
    super.initState();
    //初始化创建
    _gestureRecognizer = TapGestureRecognizer();
    _gestureRecognizer2 = TapGestureRecognizer();
    //检验是否开支持以及开启了指纹登录功能
    //封装在 FaceModel 中的方法
    initBiometrics();
  }

  @override
  void dispose() {
    _gestureRecognizer.dispose();
    _gestureRecognizer.dispose();
    super.dispose();
  }

  //页面的主体
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //背景颜色
      backgroundColor: Colors.white,
      //构建APPBar 返回按钮与右侧的按钮
      appBar: buildAppBar(),
      //内容主体
      body: Container(
        //填充屏幕空间
        width: double.infinity,
        height: double.infinity,
        child: buildColumn(),
      ),
    );
  }

  ///代码清单 13-3
  ///登录页面 LoginPage 中的方法
  ///lib/src/page/login/login_page.dart
  Column buildColumn() {
    return Column(
      children: [
        SizedBox(
          height: 44,
        ),
        Hero(
          tag: "loginTag",
          child: Material(
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: Image.asset(
                "assets/images/2.0x/app_icon.png",
                width: 60,
                height: 60,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          "欢迎登录 精彩每一天",
          style: TextStyle(fontSize: 22),
        ),
        //登录按钮
        buildLoginButton(),
        //间距
        SizedBox(height: 22),
        //隐私协议
        buildRichText(),
        //填充空白
        Expanded(
          child: Container(
            padding: EdgeInsets.only(bottom: 34),
            //水平方向排开
            child: buildRow(),
          ),
        )
      ],
    );
  }

  ///代码清单 13-1 登录页面 LoginPage 中的方法 校验是否调用指纹识别
  ///自动弹出 [FaceModel] 中的功能组合
  void initBiometrics() async {
    //第一步检测是否支持指纹等生物识别技术
    _isBiometrics = await checkBiometrics();
    if (_isBiometrics) {
      //第二步获取生物识别技术支持列表
      _biometricList = await getAvailableBiometrics();
      if (mounted) {
        setState(() {});
      }
      Future.delayed(Duration(milliseconds: 1000), () {
        //第三步调用认证功能
        authenticate();
      });
    }
  }

  ///代码清单 13-6
  ///登录页面 LoginPage 中的方法 底部的按钮
  ///lib/src/page/login/login_page.dart
  ///是否支持生物识别登录
  bool _isBiometrics = false;

  ///生物识别的列表
  List<BiometricType> _biometricList;

  Row buildRow() {
    List<Widget> _rowWidgetList = [
      SizedBox(
        width: 22,
      ),
      CustumOvalButton(
        assetPath: "assets/images/2.0x/more.png",
        clickCallBack: () {
          print("点击 更多");
          showBottomSheet();
        },
      ),
    ];
    if (_isBiometrics && _biometricList != null) {
      //支持生物识别
      _biometricList.forEach((element) {
        if (element == BiometricType.face) {
          _rowWidgetList.insert(
            0,
            CustumOvalButton(
              assetPath: "assets/images/2.0x/scan_icon.png",
              clickCallBack: () {
                print("点击 了面容登录");
                authenticate();
              },
            ),
          );
        } else if (element == BiometricType.fingerprint) {
          _rowWidgetList.insert(
              0,
              CustumOvalButton(
                assetPath: "assets/images/2.0x/zhiwen_icon.png",
                clickCallBack: () {
                  print("点击 了指纹登录");
                  authenticate();
                },
              ));
        }
        _rowWidgetList.insert(
          0,
          SizedBox(
            width: 22,
          ),
        );
      });
    }
    return Row(
      //水平方向居中
      mainAxisAlignment: MainAxisAlignment.center,
      //竖直方向底部对齐
      crossAxisAlignment: CrossAxisAlignment.end,
      children: _rowWidgetList,
    );
  }

  ///代码清单 13-6
  ///登录页面 LoginPage 中的方法 显示底部弹框的功能
  ///lib/src/page/login/login_page.dart
  void showBottomSheet() {
    //用于在底部打开弹框的效果
    showModalBottomSheet(
        builder: (BuildContext context) {
          //构建弹框中的内容
          return LoginBottomWidget();
        },
        context: context);
  }

  ///代码清单 13-4
  ///登录页面 LoginPage 中的方法 登录按钮
  ///lib/src/page/login/login_page.dart

  Container buildLoginButton() {
    return Container(
      margin: EdgeInsets.only(top: 64),
      width: 220,
      height: 44,
      child: RaisedButton(
        //按钮背景颜色
        color: Colors.blue,
        //按钮上的颜色
        textColor: Colors.white,
        onPressed: () {
          print("点击了手机号登录");
        },
        child: Text("手机号一键登录"),
      ),
    );
  }

  ///代码清单 13-5
  ///登录页面 LoginPage 中的方法 隐私协议
  ///lib/src/page/login/login_page.dart
  RichText buildRichText() {
    return RichText(
      text: TextSpan(
          text: "登录同意",
          style: TextStyle(color: Colors.grey),
          children: [
            TextSpan(
                text: "用户协议",
                style: TextStyle(
                  color: Colors.orange,
                ),
                //点击事件
                recognizer: _gestureRecognizer
                  ..onTap = () {
                    print("用户协议点击");
                  }),
            TextSpan(
              text: "和",
              style: TextStyle(color: Colors.grey),
            ),
            TextSpan(
                text: "隐私协议",
                style: TextStyle(
                  color: Colors.orange,
                ),
                //点击事件
                recognizer: _gestureRecognizer2
                  ..onTap = () {
                    print("隐私协议点击");
                  }),
          ]),
    );
  }

  ///代码清单 13-2
  ///登录页面 LoginPage 中的方法
  ///lib/src/page/login/login_page.dart
  AppBar buildAppBar() {
    return AppBar(
      //AppBar的背景色为白色
      backgroundColor: Colors.white,
      //状态栏的文字颜色为黑色
      brightness: Brightness.light,
      //阴影高度
      elevation: 0.0,
      //左侧的按钮
      leading: IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.blueGrey,
        ),
        onPressed: () {
          print("返回键点击 ");
          Navigator.of(context).pop();
        },
      ),
      //右侧的按钮
      actions: [
        FlatButton(
          child: Text("登录遇到问题"),
          onPressed: () {},
        )
      ],
    );
  }
}
