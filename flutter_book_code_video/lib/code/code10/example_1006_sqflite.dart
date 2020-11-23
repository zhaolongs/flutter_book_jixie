
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
    home: Example1006(),
  ));
}

class Example1006 extends StatefulWidget {
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
        title: Text(" 数据库 "),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        //关键代码
        child: Column(
          children: [
            TextButton(
              child: Text("创建数据库"),
              onPressed: () {
                _createDb();
              },
            ),
            TextButton(
              child: Text("增"),
              onPressed: () {
                _add();
              },
            ),
            TextButton(
              child: Text("删除"),
              onPressed: () {
                _delete();
              },
            ),
            TextButton(
              child: Text("改"),
              onPressed: () {
                _update();
              },
            ),
            TextButton(
              child: Text("查所有数据"),
              onPressed: () {
                _queryAll();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 代码清单 10-19
  /// lib/code/code10/example_1006_sqflite.dart
  ///数据库名称
  String _dbName = 'test.db';
  //数据库版本
  int version = 1;
  //创建表的SQL
  String dbTables =
      "CREATE TABLE t_user (id INTEGER PRIMARY KEY, name TEXT,age INTEGER)";
  ///创建数据库db [dbName]数据库名称 [version] 版本
  void _createDb() async {
    //获取数据库路径
    String databasesPath = await getDatabasesPath();
    // /data/user/0/com.studyyoun.flutterbookcode/databases
    //获取数据库的完整路径
    //join 函数是 path 下的一个拼接路径的函数
    // 导入 import 'package:path/path.dart';
    String path = join(databasesPath, _dbName);
    // /data/user/0/com.studyyoun.flutterbookcode/databases/test.db

    //打开数据库
    Database db = await openDatabase(path, version: version,
        onUpgrade: (Database db, int oldVersion, int newVersion) async {
      //数据库升级,只回调一次
      print("数据库需要升级！旧版：$oldVersion,新版：$newVersion");
    }, onCreate: (Database db, int version) async {
      //创建表，只回调一次
      await db.execute(dbTables,);
      await db.close();
    });
  }

  /// 代码清单 10-20 增
  /// lib/code/code10/example_1006_sqflite.dart
  void _add() async {
    //获取数据库路径
    var databasesPath = await getDatabasesPath();
    String sql = "INSERT INTO t_user(name,age) VALUES('李四','22')";
    String path = join(databasesPath, _dbName);
    print("数据库路径：$path");
    //打开数据ylkd
    Database db = await openDatabase(path);
    //插入数据
    await db.transaction((txn) async {
      //可以根据插入的行数来判断是否插入成功
      int count = await txn.rawInsert(sql);
      print("插入数据 $count");
    });
    await db.close();

    print("插入数据成功！");
  }

  /// 代码清单 10-21 删
  /// lib/code/code10/example_1006_sqflite.dart
  _delete() async {
    var databasesPath = await getDatabasesPath();
    String sql = "DELETE FROM t_user";
    String path = join(databasesPath, _dbName);
    Database db = await openDatabase(path);
    int count = await db.rawDelete(sql);
    await db.close();
    if (count > 0) {
      print("执行删除操作完成，该sql删除条件下的数目为：$count");
    } else {
      print("无法执行删除操作，该sql删除条件下的数目为：$count");
    }
  }

  /// 代码清单 10-22 改
  /// lib/code/code10/example_1006_sqflite.dart
  void _update() async {
    var databasesPath = await getDatabasesPath();
    String sql = "UPDATE t_user SET name =? WHERE id = ?";
    String path = join(databasesPath, _dbName);
    Database db = await openDatabase(path);
    //修改条件，对应参数值 参数二中的值要与 sql 中的 ？ 占位对应
    int count = await db.rawUpdate(sql, ["张三", 1]);
    await db.close();
    if (count > 0) {
      print("更新数据库操作完成，：$count");
    } else {
      print("无法更新数据库，：$count");
    }
  }

  /// 代码清单 10-23 查
  /// lib/code/code10/example_1006_sqflite.dart
  void _queryAll() async {
    var databasesPath = await getDatabasesPath();
    String sql = "SELECT * FROM t_user";
    String path = join(databasesPath, _dbName);
    Database db = await openDatabase(path);
    //获取查询的条数
    int count = Sqflite.firstIntValue(await db.rawQuery(sql));
    //获取查询到的所有的结果集
    List<Map> list = await db.rawQuery(sql);
    print("查询完毕 count：$count 数据详情：$list");
    await db.close();

  }

}
