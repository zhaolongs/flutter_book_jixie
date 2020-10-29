import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/10/30.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// 
/// 代码清单 
///代码清单

class BrandTable extends StatelessWidget {
  const BrandTable({
    Key key,
    @required this.list,
  }) : super(key: key);

  final List<TableRowData> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      child: Table(
        defaultColumnWidth: FlexColumnWidth(0.2),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(0.5),
        },
        children: list
            .map((d) => buildRow(d.text, d.color, d.count, d.hasPoint))
            .toList(),
      ),
    );
  }

  TableRow buildRow(
      String text,
      Color color,
      int count,
      bool hasPoint,
      ) {
    return TableRow(
      children: [
        Visibility(
          visible: hasPoint,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            width: 5,
            height: 5,
          ),
        ),
        Text(
          text,
          style: TextStyle(color: color),
        ),
        Text(
          count.toString(),
          style: TextStyle(color: color),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class TableRowData {
  TableRowData({this.text, this.color, this.count, this.hasPoint});

  final String text;
  final Color color;
  final int count;
  final bool hasPoint;
}
