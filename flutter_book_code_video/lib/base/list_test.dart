import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/8/30.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
class TestPage   {

  createst(){
    // 不限定长度，不限定类型，可添加任意类型的数据
    var list1 = List();
    dynamic list2 = List();
    dynamic list3 =[];

    // 不限定长度，不限定类型，可添加任意类型的数据
    List list4 = List();
    List list5 = [];

    //限定了长度为2  越界会报错，不限定类型，可添加任意类型的数据
    List list6 = List(2);

    // 不限定长度，限定类型，使用 <> 泛型来指定 List 中保存的数据类型
    List<int> list7 = List();
  }

  testAddList(){

    ///创建一个 List 并添加初始化数据
    List<int> list = [1,2,3,4];

    ///创建一个 空的 Lsit
    List<int> list2 = [];

    ///动态 添加一个元素
    list2.add(1);
    list2.add(2);
    list2.add(3);

    print(list2);//[1,2,3]

    ///向 0 号位添加一个元素 5
    list2.insert(0, 5);
    print(list2);//[5,1,2,3]

  }

  testAddList2(){
    ///创建一个 List 并添加初始化数据
    List<int> list = [1,2,3,4];

    ///创建一个  List并添加初始化数据
    List<int> list2 = [2,3,4,5];

    ///将两个 List 中的数据合并成一个 Iterable
    Iterable<int> lsit3=list2.followedBy(list);
    print("list: "+list.toString());//list: [1, 2, 3, 4]
    print("list2: "+list2.toString());//list2: [2, 3, 4, 5]
    print("list3: "+lsit3.toString());//list3: (2, 3, 4, 5, 1, 2, 3, 4)

    ///移除最后一个元素
    list2.removeLast();

    ///移除指定索引位置的元素 如这里指定的 2号位置
    list2.removeAt(2);

    ///移除List
    list2.remove(3);

    ///在 1 号位 插入 list 中的数据
    list2.insertAll(1,list);
    print(list2);//[2, 1, 2, 3, 4, 3, 4, 5]

    ///动态 添加一个元素
    list2.addAll(list);
    print(list2);//[2, 3, 4, 5, 1, 2, 3, 4]


  }



}