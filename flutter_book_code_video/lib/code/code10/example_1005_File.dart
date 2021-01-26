
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

//导包
// import 'package:flutter/services.dart' show rootBundle;

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

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example1004(),
  ));
}

class Example1004 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" File "),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        //关键代码
        child: Column(
          children: [
            TextButton(
              child: Text("loadAssetTestJson"),
              onPressed: () {
                loadAssetTestJson();
              },
            ),
            TextButton(
              child: Text("loadAssetTestJson2"),
              onPressed: () {
                loadAssetTestJson2();
              },
            ),
            TextButton(
              child: Text("getThemPath"),
              onPressed: () {
                getThemPath();
              },
            ),
            TextButton(
              child: Text("getDocumentPath"),
              onPressed: () {
                getDocumentPath();
              },
            ),
            TextButton(
              child: Text("保存文件"),
              onPressed: () {
                saveFile();
              },
            ),
            TextButton(
              child: Text("获取文件"),
              onPressed: () {
                getFile();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 代码清单 10-13 加载assets路径下的文件
  /// lib/code/code10/example_1005_File.dart
  void loadAssetTestJson() async {
    //注意是 文件 在 Flutter 项目中的完整路径
    String json = await rootBundle.loadString('assets/json/test.json');
    print("加载完成 $json");
  }

  /// 代码清单 10-14 加载assets路径下的文件
  /// lib/code/code10/example_1005_File.dart
  void loadAssetTestJson2() async {
    //注意是 文件 在 Flutter 项目中的完整路径
    String json = await DefaultAssetBundle.of(context)
        .loadString('assets/json/test.json');
    print("加载完成 $json");
  }

  /// 代码清单 10-15  临时目录
  /// lib/code/code10/example_1005_File.dart
  void getThemPath() async {
    //获取临时目录
    Directory dic = await getTemporaryDirectory();

    String path = dic.path;
    Uri uri = dic.uri;
    //父级目录
    Directory parentDic = dic.parent;
    Directory absolute = dic.absolute;

    print("path:  $path");
    print("uri:  $uri");
    print("parentDic:  $parentDic");
    print("absolute:  $absolute");
  }

  /// 代码清单 10-15  文档目录
  /// lib/code/code10/example_1005_File.dart
  void getDocumentPath() async {
    //获取文档目录
    Directory dic = await getApplicationDocumentsDirectory();

    String path = dic.path;
    Uri uri = dic.uri;
    //父级目录
    Directory parentDic = dic.parent;
    Directory absolute = dic.absolute;

    print("path:  $path");
    print("uri:  $uri");
    print("parentDic:  $parentDic");
    print("absolute:  $absolute");
  }

  /// 代码清单 10-16 外部存储目录
  /// lib/code/code10/example_1005_File.dart
  void getExternalPath() async {
    //获取外部存储目录
    Directory dic = await getExternalStorageDirectory();
  }

  /// 代码清单 10-17 保存文件
  /// lib/code/code10/example_1005_File.dart
  void saveFile() async {
    //获取文档目录
    Directory documentsDir = await getApplicationDocumentsDirectory();
    //获取对应的路径
    String documentsPath = documentsDir.path;
    //构建保存文本的路径
    String filePath = '$documentsPath/test.json';
    //创建对应的文件
    File file = new File(filePath);

    //如果文件不存在就创建
    if (!file.existsSync()) {
      file.createSync();
    } else {
      //否则就删除
      file.delete();
    }
    //向文件中写入字符串数据
    await file.writeAsString("测试数据");


    //直接调用File的writeAs函数时
    //默认文件打开方式为WRITE:如果文件存在，会将原来的内容覆盖
    //如果不存在，则创建文件
    //写入String，默认将字符串以UTF8进行编码
    //将数据内容写入指定文件中
    if (file.existsSync()) {
      print("保存成功");
    } else {
      print("保存失败");
    }
  }
  /// 代码清单 10-18 获取文件
  /// lib/code/code10/example_1005_File.dart
  void getFile() async {
    //获取文档目录
    Directory documentsDir = await getApplicationDocumentsDirectory();
    //获取对应的路径
    String documentsPath = documentsDir.path;
    //构建保存文本的路径
    String filePath = '$documentsPath/test.json';
    //读取
    File file = File(filePath);
    if (file.existsSync()) {
      print("文件存在");
      //readAsString读取文件，并返回字符串
      //默认返回的String编码为UTF8
      //相关的编解码器在dart:convert包中
      //包括以下编解码器：ASCII、LANTI1、BASE64、UTF8、SYSTEM_ENCODING
      //SYSTEM_ENCODING可以自动检测并返回当前系统编
      String data = await file.readAsString();
      print("文件内容 $data");

      //一行一行的读取
      List<String> lines = await file.readAsLines();
      lines.forEach((String line) => print(line));

    } else {
      print("文件不存在 ");
    }
  }
}
