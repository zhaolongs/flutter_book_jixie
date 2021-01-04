import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/

///通用底部显示弹框
///[context] 上下文对象
///[stringList] 列表显示的文字集合
///[callBack] 点击列表事件回调
///[isLanguage]为true 启用多语言配制
void showCommonBottomWidget(BuildContext context, List<String> stringList,
    Function(dynamic value) callBack,
    {bool isLanguage = true}) {
  //显示底部弹框
  showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return buildContainer(stringList, callBack, isLanguage, context);
      });
}

//构建弹框内容区域
Container buildContainer(List<String> stringList, callBack(dynamic value),
    bool isLanguage, BuildContext context) {
  return Container(
    //计算弹框的高度
    height: calculateWrapHeight(stringList),
    //使用层叠布局组合内容区域与关闭按钮
    child: Stack(children: [
      //显示的内容选项列表
      buildListContent(stringList, callBack, isLanguage),

      //关闭按钮
      buildCloseWidget(context)
    ]),
  );
}

//关闭按钮
Positioned buildCloseWidget(BuildContext context) {
  return Positioned(
    top: 4,
    right: 0,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.only(right: 12),
        child: Icon(
          Icons.close,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    ),
  );
}

//显示的内容选项列表
Positioned buildListContent(
    List<String> stringList, callBack(dynamic value), bool isLanguage) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    height: calculateWrapHeight(stringList),
    child: Container(
      padding: EdgeInsets.only(top: 2),
      //列表显示内容
      child: ListView.builder(
        itemCount: stringList.length,
        itemBuilder: (BuildContext context, int index) {
          //设置点击事件
          return InkWell(
            onTap: () {
              Navigator.of(context).pop();
              callBack(index);
            },
            child: Container(
              alignment: Alignment.center,
              height: 52,
              width: double.infinity,
              //设置分割线
              decoration: BoxDecoration(
                border: Border(
                  //最后一个条目不需要分割线
                  bottom: BorderSide(
                      style: index == stringList.length - 1
                          ? BorderStyle.none
                          : BorderStyle.solid,
                      width: 1.0,
                      color: Theme.of(context).dividerColor),
                ),
              ),
              //设置显示文字
              child: Text(stringList[index]),
            ),
          );
        },
      ),
    ),
  );
}

//动态计算底部弹框的高度
//[list]根据list中的数据多少来计算
//最小高度为 120 最大高度为468
double calculateWrapHeight(List list) {
  if (list.length <= 2) {
    return 120.0;
  } else if (list.length > 2 && list.length < 9) {
    return list.length * 52 * 1.0;
  } else {
    return 9 * 52 * 1.0;
  }
}
