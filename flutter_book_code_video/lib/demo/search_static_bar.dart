import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/23.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/demo/search_static_bar.dart
///圆角搜索框显示
class SearchStaticBar extends StatelessWidget {
  ///搜索框上显示的文案
  String hint;
  ///hero过渡动画的tag
  String heroTag;
  ///搜索框的圆角
  double defaultBorderRadius;
  ///外边距
  EdgeInsets margin;
  ///内边距
  EdgeInsets padding;
  ///点击的回调事件
  Function clickCallBack;
  ///如果考虑不需要水波纹效果那么就可以设置颜色为透明色
  Color splashColor;

  SearchStaticBar(
      {this.hint = "搜索",
      this.defaultBorderRadius = 20.0,
      this.margin = const EdgeInsets.only(top: 10.0, bottom: 10.0),
      this.padding = const EdgeInsets.only(top: 8.0, bottom: 8.0),
      this.heroTag,
      this.clickCallBack,
      this.splashColor = const Color(0xFFD6D6D6)});
  @override
  Widget build(BuildContext context) {
    return Container(
      ///外边距
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: Ink(
            ///圆角边框
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(defaultBorderRadius),
            ),
            child: InkWell(
              onTap: () {
                if (clickCallBack != null) {
                  clickCallBack();
                }
              },
              splashColor: splashColor,
              ///点击事件的圆角
              ///表现为水波纹的圆角
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              ///页面过渡动画
              child: buildHeroWidget(context),
            )),
      ),
    );
  }


  ///构建[Hero]过渡动画
  Widget buildHeroWidget(BuildContext context) {
    if (heroTag == null) {
      return buildContainer(context);
    } else {
      return Hero(
        tag: heroTag,
        child: buildContainer(context),
      );
    }
  }
  ///构建搜索框的显示区域[Container]
  Container buildContainer(BuildContext context) {
    return Container(
      ///获取当前StatelessWidget的宽度
      width: MediaQuery.of(context).size.width,
      ///对齐方式
      alignment: Alignment(-1, 0),
      ///内边距
      padding: padding,
      child: buildRow(),
    );
  }
  ///构建搜索图标与显示文本
  Row buildRow() {
    return Row(
      ///居中
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ///搜索图标
        Image.asset(
          "assets/images/2.0x/search_icon.png",
          width: 14.0,
          height: 14.0,
        ),
        SizedBox(width: 8.0,),
        Text(
          hint,
          style: TextStyle(color: Color(0xff999999), fontSize: 16.0),
        ),
      ],
    );
  }
}

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSearch;
  final double horizontalPadding;
  final bool home;
  final String hint;
  final bool backIcon;
  final bool isShowNavTop;

  ///是否显示最左侧的搜索字样
  final bool isShowSearchButton;

  const SearchBar({
    Key key,
    this.home = false,
    this.isShowNavTop = false,
    this.onChanged,
    this.onSearch,
    this.horizontalPadding: 32.0,
    this.hint = "搜索",
    this.backIcon = true,
    this.isShowSearchButton = true,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(48.0);
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  bool showHint = false;
  FocusNode _focusNode = new FocusNode();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _goSearch();
  }

  _goSearch() {
    return GestureDetector(
      onTap: () {},
      child: widget.home ? _goHomeSearch() : _goNormalSearch(),
    );
  }

  _goHomeSearch() {
    return Container(
      color: Color(0xfff2f2f2),
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
      child: _inputBox(),
    );
  }

  _goNormalSearch() {
    return Container(
      height: 58.0,
      color: Color(0xfff2f2f2),
      margin: EdgeInsets.only(
          top: widget.isShowNavTop
              ? MediaQueryData
              .fromWindow(window)
              .padding
              .top
              : 0.0),
      padding: EdgeInsets.only(right: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _wrapGesture(
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 6.0),
                child: widget.backIcon
                    ? Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xff1d1d1d),
                  size: 20.0,
                )
                    : Container(),
              ),
              leftButtonClick),
          Expanded(flex: 1, child: _inputBox()),
        ],
      ),
    );
  }

  _wrapGesture(Widget widget, void Function() callback) {
    return InkWell(
      onTap: callback,
      child: widget,
    );
  }

  _inputBox() {
    Color inputBoxBackgroundColor;
    inputBoxBackgroundColor = Colors.white;
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      alignment: Alignment(-1, 0),
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      decoration: BoxDecoration(
        color: inputBoxBackgroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              widget.home
                  ? Container()
                  : Container(
                alignment: Alignment(-1, 0),
                padding: EdgeInsets.only(
                  left: 4.0,
                ),
                child: Image.asset(
                  "assets/images/2.0x/search_icon.png",
                  width: 15.0,
                  height: 15.0,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: widget.home
                    ? Container()
                    : Container(
                    alignment: Alignment(-1, 0),
                    child: TextField(
                      controller: controller,
                      onChanged: (text) => _onChange(text),
                      onSubmitted: (text) => _onSearch(text),
                      autofocus: false,
                      focusNode: _focusNode,
                      enabled: !widget.home,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 12),
                          hintText: widget.hint,
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xff999999),
                          )),
                    )),
              ),
              showClear
                  ? _wrapGesture(
                  Icon(
                    Icons.clear,
                    size: 24.0,
                    color: Color(0xffacacac),
                  ), () {
                controller.clear();
                _onChange("");
                setState(() {});
              })
                  : Container(),
            ],
          ),
          showClear
              ? Container()
              : widget.home
              ? Container(
            padding: EdgeInsets.only(bottom: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/2.0x/search_icon.png",
                  width: 14.0,
                  height: 14.0,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  widget.hint,
                  style: TextStyle(
                      color: Color(0xff999999), fontSize: 16.0),
                ),
              ],
            ),
          )
              : Container(),
          buildSearchButton(),
        ],
      ),
    );
  }

  buildSearchButton() {
    return (widget.isShowSearchButton && showClear)
        ? Positioned(
      right: 30,
      child: InkWell(
        onTap: () {
          _onSearch(controller.text);
        },
        child: Container(
          alignment: Alignment.centerRight,
          width: 40,
          child: Text(
            "搜索",
            style: TextStyle(fontSize: 12, color: Colors.blue),
          ),
        ),
      ),
    )
        : Container();
  }

  _onChange(String text) {
    if (text.length > 0) {
      showClear = true;
    } else {
      showClear = false;
    }

    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
    setState(() {});
  }

  _onSearch(String text) {
    ///注销焦点
    _focusNode.unfocus();
    if (widget.onSearch != null) {
      widget.onSearch(text);
    }
  }

  void leftButtonClick() {
    Navigator.pop(context);
  }
}


