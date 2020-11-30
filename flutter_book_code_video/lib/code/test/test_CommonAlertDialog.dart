import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/page/common/common_bottom_dialog.dart';
import 'package:flutterbookcode/app/page/common/common_dialog.dart';
import 'package:flutterbookcode/app/page/common/permission_request_page.dart';
import 'package:flutterbookcode/utils/time_date_utils.dart';
import 'package:permission_handler/permission_handler.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/11/27.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: TestAlertDialogPage(),
  ));
}

/// 代码清单
///测试全局通用自定义弹框
class TestAlertDialogPage extends StatefulWidget {
  @override
  _TestAlertDialogPageState createState() => _TestAlertDialogPageState();
}

class _TestAlertDialogPageState extends State<TestAlertDialogPage> {
  String currentText = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹框"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(border: Border.all()),
                child: Text("$currentText"),
              ),
              ElevatedButton(
                child: Text("通用弹框显示"),
                onPressed: () {
                  //一个通用的弹出对话框
                  showCommonAlertDialog(
                    headerTitle: "提示",
                    //中间显示的内容
                    contentMessag: "些内容删除后将不可恢复，确定删除吗???",
                    //左侧按钮
                    cancleText: "再考虑一下",
                    //右侧按钮
                    selectText: "考虑好了",
                    //右侧按钮点击事件回调
                    selectCallBack: () {
                      print("选择了右侧按钮");
                    },
                    //左侧按钮点击事件回调
                    cancleCallBack: () {
                      print("选择了左侧按钮");
                    },
                    //上下文
                    context: context,
                  );
                },
              ),
              StatefulBuilder(builder: (BuildContext context,
                  void Function(void Function()) setState) {
                return ElevatedButton(
                  child: Text("底部弹框显示"),
                  onPressed: () {
                    //一个通用的弹出对话框
                    showCommonBottomWidget(
                        context, ["测试数据A", "测试数据B", "测试数据C"], (value) {

                    });
                  },
                );
              },),
              ElevatedButton(
                child: Text("权限请求显示"),
                onPressed: () {
                  //权限请求封装功能
                  //如果当前配制的权限通过就直接回调dismissCallback方法
                  showPermissionRequestPage(
                      context: context,
                      //点击退出关闭APP
                      isColseApp: true,
                      //在这里请求的是文件读写权限
                      permission: Permission.storage,
                      //对应的弹框提示语
                      permissionMessageList: permissList,
                      //权限请求完成后的回调
                      dismissCallback: (value) {
                        //权限请求通过返回true
                        //权限请求结束获取权限后进行初始化操作
                        //如果未获取权限是对权限进行关闭的

                      },);
                },),


            ],
          )),
    );
  }

  //定义弹框提示语
  // 第一句是第一次申请权限时的提示说明
  // 第二句是用户第一次拒绝后的提示说明
  // 第三句是用户第二次拒绝后的提示说明
  // 第四名是当前的应用程序打开设置中心失败的提示
  List<String> permissList =[
    "为您更好的体验应用，所以需要获取您的手机文件存储权限，以保存您的一些偏好设置",
    "您以拒绝权限，所以无法保存您的一些偏好设置，将无法使用APP",
    "您以拒绝权限，为您更好的体验应用，所以需要获取您的手机文件存储权限，以保存您的一些偏好设置，请在设置中同意App的权限请求",
    "暂时无法打开设置中心，请您打开手机设置->应用管理-同意权限",
  ];
}
