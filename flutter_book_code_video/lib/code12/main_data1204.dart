import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/6.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class ModalBottomSheetPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1204.dart
class _TestPageState extends State<ModalBottomSheetPage> {
  ///保存优惠券信息的集合
  List<DiscountCouponModel> list = [];
  ///当前显示选择优惠券信息
  String selectDiscountMessage="";
  @override
  void initState() {
    super.initState();
    ///构建优惠券信息
    list.add(DiscountCouponModel(-1, "暂不使用优惠券", 0));
    ///初始化优惠券相关数据
    for (var i = 0; i < 10; i++) {
      list.add(DiscountCouponModel(i, "优惠大放送，$i 折券", i * 2.toDouble()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("优惠券弹框"),
      ),
      body: Column(children: [
        RaisedButton(
          child: Text("显示优惠券弹框"),
          onPressed: () {
            showDiscountCoupon();
          },
        ),
        Padding(padding: EdgeInsets.only(top: 22),child: Text("$selectDiscountMessage"),)
      ],),
    );
  }

  //lib/code/main_data1204.dart
  ///显示优惠券底部弹框
  void showDiscountCoupon() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return new Container(
          height: 400.0,
          ///显示优惠券弹框的具体UI
          child: DiscountCouponPage(list),
        );
      },
    ).then((val) {
      ///当点击弹框黑色背景时弹框会消失也会回调
      ///此时无数据回传 val为null
      if (val != null) {
        if (val != null) {
          ///弹框关闭的的回调
          DiscountCouponModel model = val;

          ///刷新页面显示
          setState(() {
            selectDiscountMessage = model.couponMessage;
          });
        }
      }
    });
  }
}

//lib/code/main_data1204.dart
///优惠券数据模型
class DiscountCouponModel {
  ///唯一标识
  int id;
  ///优惠券显示的文字说明
  String couponMessage;
  ///优惠券优惠的金额
  double monney;
  ///使用时间
  String couponDate = "2020.04.05 -2020.04.10";

  DiscountCouponModel(this.id, this.couponMessage, this.monney);
}

//lib/code/main_data1204.dart
///优惠券内容UI
class DiscountCouponPage extends StatefulWidget {
  ///优惠券选择列表数据
  List<DiscountCouponModel> list;

  DiscountCouponPage(this.list);

  @override
  _DiscountCouponPageState createState() => _DiscountCouponPageState();
}

class _DiscountCouponPageState extends State<DiscountCouponPage> {
  ///默认选中的单选框的值
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择优惠券"),
        leading: buildColoseButton(),
      ),
      ///StatefulBuilder用于弹框中内容更新
      body: StatefulBuilder(builder: (context, state) {
        return buildDiscountCouponListView(state);
      }),
    );
  }
  //lib/code/main_data1204.dart
  ///列表展示优惠券内容
  ListView buildDiscountCouponListView(StateSetter state) {
    return ListView.builder(
        ///优惠券数量
        itemCount: widget.list.length,
        ///子Item显示的UI
        itemBuilder: (BuildContext context, int index) {
          ///获取对应的条目数据
          DiscountCouponModel couponModel = widget.list[index];
          ///用于设置每个条目的灰色小间隔效果
          return Container(
            color: Color(0xfff5f5f5),
            padding: EdgeInsets.only(bottom: 2.0),
            ///用于设置整个条目的白色背景
            child: Container(
              color: Colors.white,
              child: RadioListTile(
                title: buildRadioTitleWidget(couponModel),
                onChanged: (value) {
                  state(() {
                    groupValue = value;
                  });
                },
                value: index,
                ///Radio设置在右侧
                controlAffinity: ListTileControlAffinity.trailing,
                groupValue: groupValue,
              ),
            ),
          );
        });
  }
  //lib/code/main_data1204.dart
  ///列表展示优惠券内容
  Container buildRadioTitleWidget(DiscountCouponModel couponModel) {
    return
      Container(
      child: Row(
        children: [
          ///显示优惠金额的区域
          Stack(
            alignment: Alignment.center,
            children: [
              ///Image用来设置背景
              Image.asset(
                "assets/images/2.0x/discount_coupon.png",
                height: 80,
                width: 120,
                fit: BoxFit.fill,
              ),
              ///这里用来显示优惠的金额
              Positioned(
                left: 0,
                right: 0,
                child: Text(
                  "￥${couponModel.monney}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ],
          ),
          ///用来设置左右间距
          SizedBox(width: 12,),
          ///用来设置具体的优惠券的内容说明
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${couponModel.couponMessage}",
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${couponModel.couponDate}",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              )
            ],
          )
        ],
      ),
    );
  }

  ///关闭按钮
  buildColoseButton() {
    return CloseButton(
      onPressed: () {
        ///获取当前选择的优惠券
        DiscountCouponModel selectModel = widget.list[groupValue];
        ///关闭弹框并回传数据
        Navigator.of(context).pop(selectModel);
      },
    );
  }
}
