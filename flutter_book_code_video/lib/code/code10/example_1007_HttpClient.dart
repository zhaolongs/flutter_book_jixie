import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
    home: Example1007(),
  ));
}

class Example1007 extends StatefulWidget {
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
        title: Text(" HttpClient 网络 请求 "),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        //关键代码
        child: Column(
          children: [
            TextButton(
              child: Text("HttpClient  GET 请求无参数"),
              onPressed: () {
                getRequest();
              },
            ),
            TextButton(
              child: Text("HttpClient  post 请求注册用户"),
              onPressed: () {
                postRequest();
              },
            ),
            TextButton(
              child: Text("Client  GET 请求无参数"),
              onPressed: () {
                getClientRequest();
              },
            ),
            TextButton(
              child: Text("删除"),
              onPressed: () {},
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

  /// 代码清单 10-24 get请求无参数
  /// lib/code/code10/example_1007_HttpClient.dart

  /// 网络调用通常遵循如下步骤：
  /// 1 创建 client.
  /// 2 构造 Uri.
  /// 3 发起请求, 等待请求，同时您也可以配置请求headers、 body。
  /// 4 关闭请求, 等待响应.
  /// 5 解码响应的内容.
  /// get 无参数请求
  void getRequest() async {
    ///定义请求URL
    String url = 'http://192.168.40.167:8080/getUserList';
    //第一就创建 Client
    HttpClient httpClient = new HttpClient();
    String result;
    try {
      //第二步构建 Uri
      Uri uri = Uri.parse(url);
      //第三步发送get请求
      HttpClientRequest request = await httpClient.getUrl(uri);
      //第四步获取响应同时关闭通道
      HttpClientResponse response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        //请求成功 获取数据
        String json = await response.transform(utf8.decoder).join();
        //解析数据
        var data = jsonDecode(json);
        result = data.toString();
        print("请求到的数据为 ${data.toString()}");
      } else {
        result = '请求异常 ${response.statusCode}';
      }
    } catch (exception) {
      //异常数据处理
      result = 'Failed getting IP address';
    }
    setState(() {
      _netData = result;
    });
  }

  /// 代码清单 10-25 post 请求参数为 json 格式
  /// lib/code/code10/example_1007_HttpClient.dart
  void postRequest() async {
    HttpClient client = HttpClient();
    ///定义请求URL
    String url = 'http://192.168.40.167:8080/registerUser2';
    Uri uri = Uri.parse(url);
    //请求参数
    Map<String, dynamic> map = {"name": "张三", "age": 22};
    //发起网络请求
    final request = await client.postUrl(uri);
    //设置请求头
    request.headers
        .set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
    //设置参数
    request.write(map.toString());
    //获取响应
    final response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      //请求成功 获取数据 这里通过监听的方式来获取的结果
      response.transform(utf8.decoder).listen((contents) {
        setState(() {
          _netData = contents;
        });
      });
    } else {
      //请求失败
      setState(() {
        _netData = "请求失败";
      });
    }
  }

  /// 代码清单 10-26 post 请求参数为 json 格式
  /// lib/code/code10/example_1007_HttpClient.dart
  void getClientRequest() async {
    Client client = Client();

    var url = 'http://192.168.40.167:8080/getUserList';
    var response = await client.get(url,headers: {"charset":"utf-8"});


    if (response.statusCode == HttpStatus.ok) {

      response.body;
      //请求成功
      setState(() {
        _netData = response.body.toString();
      });
    } else {
      //请求失败
      setState(() {
        _netData = "请求失败";
      });
    }


  }


}
