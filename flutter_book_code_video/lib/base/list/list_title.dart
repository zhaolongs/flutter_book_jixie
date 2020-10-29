import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'arrow_button.dart';
import 'header_icon.dart';


/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/10/30.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// 
/// 代码清单 
///代码清单
class CommonListTile extends StatefulWidget {
  const CommonListTile({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.main,
    this.extra,
  })  : assert(main != null),
        assert(title != null),
        assert(icon != null),
        super(key: key);

  final String title;
  final RoundedCornerIcon icon;
  final Widget main;
  final Widget extra;

  @override
  _CommonListTileState createState() => _CommonListTileState();
}
class _CommonListTileState extends State<CommonListTile> {
  double maxExtend = 200;

  double extraHeight;
  double mainHeight;

  final GlobalKey mainKey = GlobalKey();
  final GlobalKey extraKey = GlobalKey();
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => setState(
            () {
          mainHeight = mainKey.currentContext.size.height;
          if (widget.extra != null) {
            extraHeight = extraKey.currentContext.size.height;
          }
          maxExtend = mainHeight + 45;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: false,
      delegate: _TodayListTileDelegate(
          mainKey: mainKey,
          extraKey: extraKey,
          widget: widget,
          maxExtent: maxExtend,
          isOpen: isOpen,
          setMaxExtend: (bool isOpen) {
            setState(() {
              this.isOpen = isOpen;
              this.maxExtend =
                  (isOpen ? mainHeight + extraHeight : mainHeight) + 45;
            });
          }),
    );
  }
}

class _TodayListTileDelegate extends SliverPersistentHeaderDelegate {
  final CommonListTile widget;
  final void Function(bool isOpen) setMaxExtend;

  _TodayListTileDelegate({
    this.widget,
    this.maxExtent,
    this.setMaxExtend,
    this.mainKey,
    this.extraKey,
    this.isOpen,
  });

  final Key mainKey;
  final Key extraKey;
  final bool isOpen;

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    var leftSize = maxExtent - shrinkOffset;
    var v = leftSize.clamp(0, 45) / 45;

    bool isShrinking = v < 1;

    var scale = v * 0.2 + 0.8;
    var dy = 5 - (leftSize.clamp(0, 30) / 30) * 5;
    var child = Transform.scale(
      scale: scale,
      child: Transform.translate(
        offset: Offset(0, dy),
        child: Container(
          margin: EdgeInsets.only(bottom: 5),
          height: isShrinking ? 40 : null,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.18),
                ),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      tileHeader(),
                      Container(
                        key: mainKey,
                        child: widget.main,
                      ),
                      if (widget.extra != null)
                        Container(
                          key: extraKey,
                          child: widget.extra,
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (isShrinking) {
      return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: IgnorePointer(
          ignoringSemantics: false,
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            child: child,
          ),
        ),
      );
    }

    return child;
  }

  Padding tileHeader() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          widget.icon,
          SizedBox(width: 10),
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.white30,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          Spacer(),
          if (widget.extra != null)
            ArrowButton(
              onTap: setMaxExtend,
              isExpanded: isOpen,
            ),
        ],
      ),
    );
  }

  @override
  double maxExtent;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
