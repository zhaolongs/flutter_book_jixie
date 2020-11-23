import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example1008(),
  ));
}

class Example1008 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State {
  String _netData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Dio 网络 请求 "),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        //关键代码
        child: Column(
          children: [
            TextButton(
              child: Text("  GET 请求无参数"),
              onPressed: () {
                getRequest();
              },
            ),
            TextButton(
              child: Text(" GET 请求有参数"),
              onPressed: () {
                getRequestFunction2();
              },
            ),
            TextButton(
              child: Text("post 请求 FormData 参数格式"),
              onPressed: () {
                postRequestFunction();
              },
            ),
            TextButton(
              child: Text("post 请求 JSON 参数格式"),
              onPressed: () {
                postRequestFunction2();
              },
            ),
            TextButton(
              child: Text("改"),
              onPressed: () {},
            ),
            Container(
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(border: Border.all()),
              child: Text("$_netData"),
            )
          ],
        ),
      ),
    );
  }

  /// 代码清单 10-27 Dio get 请求无参数
  /// 获取所有的用户信息
  /// lib/code/code10/example_1008_Dio.dart
  void getRequest() async {
    //定义请求URL 获取用户列表
    String url = 'http://192.168.40.167:8080/getUserList';
    //创建Dio对象
    Dio dio = new Dio();
    //发起get请求
    Response response = await dio.get(url);
    //响应数据 JSON 格式为 {"code": 200,"data": [],"message": "请求成功"}
    //这里第一层映射将 JSON 数据 转为 Map 类型
    Map<String, dynamic> responseMap = response.data;

    //然后在 映射的这个 responseMap 中，

    ///解析第二层 对应的 JSON 中的 data 是一个数组
    List<dynamic> dataList = responseMap["data"];

    ///创建一个保存 UserBean 的集合 List
    List<UserBean> userBeanList = [];

    ///解析第三层 就是数组中对应的 对象类型数据
    for (int i = 0; i < dataList.length; i++) {
      Map<String, dynamic> itemMap = dataList[i];

      UserBean userBean = new UserBean();
      userBean.id = itemMap["id"];
      userBean.age = itemMap["age"];
      userBean.userName = itemMap["userName"];
      userBean.realName = itemMap["realName"];

      userBeanList.add(userBean);
    }

    setState(() {
      _netData = dataList.toString();
    });
  }

  /// 代码清单 10-27 Dio get 请求有参数
  /// 根据用户ID来获取用户信息
  /// lib/code/code10/example_1008_Dio.dart
  void getRequestFunction2() async {
    //用户id
    int userId = 3;

    //创建 dio
    Dio dio = new Dio();

    //请求地址
    //传参方式1
    String url = "http://192.168.40.167:8080/getUser/$userId";
    //传参方式2
    String url2 = "http://192.168.40.167:8080/getUser?userId=$userId";
    //传参方式 3 通过下面的map
    String url3 = "http://192.168.40.167:8080/getUser";

    Map<String, dynamic> map = Map();
    map["userId"] = userId;

    try {
      //发起get请求
      Response response = await dio.get(url3, queryParameters: map);
      //响应数据 解析第一层
      Map<String, dynamic> rootData = response.data;
      ///解析第二层
      Map<String, dynamic> data = rootData["data"];

      ///映射数据模型
      UserBean userBean = new UserBean();
      userBean.id = data["id"];
      userBean.age = data["age"];
      userBean.userName = data["userName"];
      userBean.realName = data["realName"];

      // 将响应数据解析为 UserBean
      // UserBean userBean = UserBean.fromJson(data);

      _netData = data.toString();
    } catch (e) {
      //异常
      _netData = e.toString();
    }

    setState(() {});
  }

  /// 代码清单 10-28 Dio post 请求 [FormData]格式
  /// 根据用户ID来获取用户信息
  /// lib/code/code10/example_1008_Dio.dart
  void postRequestFunction() async {
    //创建Dio
    Dio dio = new Dio();
    //发送 FormData:
    FormData formData = FormData.fromMap({"userName": "张三", "userAge": 22});
    //请求UIR
    String url = "http://192.168.40.167:8080/registerUser";
    //发起 post 请求 如这里的注册用户信息
    Response response = await dio.post(url, data: formData);
    String result = response.data.toString();
    setState(() {
      _netData = result;
    });
  }

  /// 代码清单 10-29 Dio post 请求 发送 json 数据
  /// 根据用户ID来获取用户信息
  /// lib/code/code10/example_1008_Dio.dart
  void postRequestFunction2() async {
    //请求 url
    String url = "http://192.168.40.167:8080/registerUser2";

    //创建Dio
    Dio dio = new Dio();
    //创建Map 封装参数
    Map<String, dynamic> map = Map();
    map['userName'] = "小明";
    map['userAge'] = 44;

    //发起post请求
    Response response = await dio.post(url, data: map);
    //获取响应结果
    var data = response.data;

    setState(() {
      _netData = data.toString();
    });
  }

  /// 代码清单 10-30 Dio post 实现文件上传
  /// lib/code/code10/example_1008_Dio.dart
  ///
  ///手机中的图片
  String localImagePath = "/storage/emulated/0/Download/17306285.jpg";

  ///上传的服务器地址
  String netUploadUrl = "http://192.168.0.102:8080/fileupload";

  ///dio 实现文件上传
  void fileUplod() async {
    //创建Dio
    Dio dio = new Dio();

    Map<String, dynamic> map = Map();
    map["auth"] = "12345";
    //图片数据 记住一定要 await
    map["file"] =
        await MultipartFile.fromFile(localImagePath, filename: "xxx23.png");
    //通过FormData 传参数
    FormData formData = FormData.fromMap(map);
    //发送post
    Response response = await dio.post(
      netUploadUrl, data: formData,

      //这里是发送请求回调函数
      //[progress] 当前的进度
      //[total] 总进度
      onSendProgress: (int progress, int total) {
        print("当前进度是 $progress 总进度是 $total");
      },
    );

    ///服务器响应结果
    var data = response.data;
  }

  /// 代码清单 10-31 Dio post 实现文件上传
  /// lib/code/code10/example_1008_Dio.dart
  ///
  ///当前进度进度百分比  当前进度/总进度 从0.0 ~ 1.0
  double currentProgress = 0.0;

  ///下载文件的网络路径
  String apkUrl = "";

  ///使用dio 下载文件
  void downApkFunction() async {
    //申请写文件权限
    //
    //手机储存目录
    String savePath = await getPhoneLocalPath();
    String appName = "rk.apk";

    //创建DIO
    Dio dio = new Dio();

    //参数一 文件的网络储存URL
    //参数二 下载的本地目录文件
    //参数三 下载监听
    Response response = await dio.download(apkUrl, "$savePath$appName",
        onReceiveProgress: (received, total) {
      if (total != -1) {
        //当前下载的百分比例
        print((received / total * 100).toStringAsFixed(0) + "%");
        // CircularProgressIndicator(value: currentProgress,) 进度 0-1
        currentProgress = received / total;
        setState(() {});
      }
    });
  }

  //获取手机的存储目录路径
  //getExternalStorageDirectory() 获取的是  android 的外部存储 （External Storage）
  //  getApplicationDocumentsDirectory 获取的是 ios 的Documents` or `Downloads` 目录
  Future<String> getPhoneLocalPath() async {
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory.path;
  }

  /// 代码清单 10-32 Dio 配置代理抓包
  /// lib/code/code10/example_1008_Dio.dart
  _setupPROXY(Dio dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        ///这里的 192.168.0.102:8888就是我们的代理服务地址
        return "PROXY 192.168.0.102:8888";
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
  }

  /// 代码清单 10-33 Dio  公共请求参数配置
  /// lib/code/code10/example_1008_Dio.dart
  ///
  String application = "V 1.2.2";
  int appVersionCode = 122;

  ///[url]网络请求链接
  ///[data] post 请求时传的json数据
  ///[queryParameters] get请求时传的参数
  void configCommonPar(url, data, Map<String, dynamic> queryParameters) {
    ///配制统一参数
    if (data != null) {
      data['application'] = application;
      data['appVersionCode'] = appVersionCode.toString();
    } else if (queryParameters != null) {
      queryParameters['application'] = application;
      queryParameters['appVersionCode'] = appVersionCode.toString();
    } else {
      ///url中有可能拼接着其他参数
      if (url.contains("?")) {
        url += "&application=$application&appVersionCode=$appVersionCode";
      } else {
        url += "?application=$application&appVersionCode=$appVersionCode";
      }
    }
  }
}

/// 用户信息数据模型
/// lib/code/code10/example_1008_Dio.dart
class UserBean {
  String userName;
  String realName;
  int age;
  int id;

  static UserBean fromJson(Map<String, dynamic> rootData) {
    ///解析第一层
    Map<String, dynamic> data = rootData["data"];

    ///解析第二层
    UserBean userBean = new UserBean();

    userBean.id = data["id"];
    userBean.age = data["age"];
    userBean.userName = data["userName"];
    userBean.realName = data["realName"];
    return userBean;
  }
}
