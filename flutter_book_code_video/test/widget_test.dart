import 'package:flutter_test/flutter_test.dart';

void main() {
  test("String.split() splits the string on the delimiter", () {
    ///创建一个 List 并添加初始化数据
    List<String> list = ["test1", "xioming", "张三", "李四"];

    ///移除最后一个元素
    list.removeLast();

    ///移除指定索引位置的元素 如这里指定的 2号位置
    list.removeAt(2);

    ///移除List 中指定的元素
    list.remove("张三");

    ///移除指定 索引区域的元素
    ///如这里移除 0号 - 2号
    list.removeRange(0, 2);
  });

  test("String.split() splits the string on the delimiter", () {
    ///创建一个 List 并添加初始化数据
    List<String> list = ["test1", "xioming", "张三", "李四"];

    print("list: " + list.toString()); //list: [test1, xioming, 张三, 李四]

    ///移除指定 索引区域的元素
    ///如这里移除索引范围为 [0,2) 也就是移除了 0号位与1号位上的元素
    list.removeRange(0, 2);

    print("list: " + list.toString()); //list: [张三, 李四]

    // 从此列表中删除满足的所有对象。
    list.removeWhere((item) {
      return item.length == 3;
    });
  });

  test("String.split() splits the string on the delimiter", () {
    ///创建一个 List 并添加初始化数据
    List<String> list = ["test1", "xioming", "张三", "李四"];

    print("list: " + list.toString()); //list: [test1, xioming, 张三, 李四]

    // 从List中中删除满足条件的所有对象。
    list.removeWhere((item) {
      ///在这里 张三, 李四 的 length 分别为2 ，满足条件 所以会被删除
      return item.length == 2;
    });

    print("list: " + list.toString()); //list: [test1, xioming]
  });

  test(" alert list data", () {
    ///创建一个 List 并添加初始化数据
    List<String> list = ["test1", "xioming", "张三", "xioming", "张三", "李四"];

    print("list: " + list.toString()); //list: [test1, xioming, 张三, 李四]

    ///直接根据索引获取 0 号位置上的数据
    String value = list[0];

    /// 等效于 elementAt 方法获取
    String value1 = list.elementAt(0);

    ///从索引0处开始查找指定元素，返回指定元素的索引
    int index = list.indexOf("张三");

    ///index 2
    ///
    ///从索引0处开始查找指定元素，如果存在返回元素索引，否则返回-1
    int index2 = list.indexOf("张三", 3);

    ///  4
    ///
    ///从后往前查找，返回查找到的第一个元素的索引
    int index4 = list.lastIndexOf("张三");

    /// 4

    print("value: " +
        index.toString() +
        "  value1 " +
        index2.toString() +
        "  " +
        index4.toString()); //list: [测试数据, xioming, 张三, 李四]
    ///修改数据
    list[0] = "测试数据";

    print("list: " + list.toString()); //list: [测试数据, xioming, 张三, 李四]

    List<String> list2 = ["223", "35", "67", "88"];
    list.setRange(0, 2, list2);

    print("list: " + list.toString()); //list: [223, 35, 张三, 李四]
  });

  test(" alert list data", () {
    ///创建一个 List 并添加初始化数据
    List<String> list = ["test1", "xioming", "张三", "xioming", "张三", "李四"];

    ///获取第一个满足条件的元素
    String value = list.firstWhere((element) {
      return element.length == 2;
    });
    print("value: " + value.toString()); //value: 张三

    ///获取第一个满足条件的元素
    String value2 = list.lastWhere((element) {
      return element.length == 2;
    });
    print("value2: " + value2.toString()); //value2: 李四

    ///从后向前找 返回第一个满足条件的元素的 索引位置
    int index = list.lastIndexWhere((element) {
      return element.length == 2;
    });
    print("index: " + index.toString()); //index: 5
  });

  test(" alert list data", () {
    ///创建一个 List 并添加初始化数据
    List<String> testList = ["test1", "xioming", "张三", "xioming", "张三", "李四"];

    ///从0开始取count个元素，并返回结果
    ///如这里的取 3 个元素
    Iterable<String> takeIterable = testList.take(3);
    print(takeIterable); //(test1, xioming, 张三)

    ///从0开始取，直至第一个不符合函数的元素，将其前面的元素都返回。
    Iterable<String> takeIterable2 = testList.takeWhile((element) {
      ///实际上可理解为这里返回的为 false 就停止遍历
      return element.length > 2;
    });
    print(takeIterable2); //(test1, xioming)

    ///根据指定参数函数筛选每个元素，符合条件的元素组成一个新的Iterable
    Iterable<String> takeIterable3 = testList.where((element) {
      ///实际上可理解为这里返回的为 false 就停止遍历
      return element.length > 2;
    });
    print(takeIterable3); //(test1, xioming, xioming)

    ///方式五 遍历现有List的每个元素，并做处理，返回一个新的Iterable
    Iterable<String> iterable = testList.map((e) {
      ///将 List 中的 String 长度为 2 的元素数据规制
      return e.length == 2 ? "a" : e;
    }); //用指定方法对每个元素做操作，将结果组成一个新的Iterable
    print(iterable); //(test1, xioming, a, xioming, a, a)
    ///再遍历 Iterable 就可取出数据
    iterable.forEach((element) {
//      print(element);
    });
  });

  test(" alert list data", () {
    ///创建一个 List 并添加初始化数据 List 中数据类型不定
    List<dynamic> testList = ["test1", 2, true, "xioming", 3, "李四"];

    //从混合类型的List中，筛选出指定类型的数据
    //如这里筛选出 List 中所有 int类型 数据
    Iterable<int> iterable = testList.whereType();
    print(iterable); //(2, 3)
  });

  test(" 去重复", () {
    List<String> testList = ["test1", "xioming", "张三", "xioming", "张三", "李四"];
    print(testList); //[test1, xioming, 张三, xioming, 张三, 李四]
    //将list转为set,将后面重复的都去掉
    Set<String> set = testList.toSet();
    print(set); //{test1, xioming, 张三, 李四}
  });

  test(" 转 map ", () {
    List<String> testList = ["test1", "xioming", "张三", "xioming", "张三", "李四"];
    print(testList); //[test1, xioming, 张三, xioming, 张三, 李四]
    //将list转为set,将后面重复的都去掉
    Map<int,String> map = testList.asMap();
    print(map); //{0: test1, 1: xioming, 2: 张三, 3: xioming, 4: 张三, 5: 李四}
  });

  test(" 随机排列 ", () {
    List<String> testList = ["test1", "xioming", "张三", "xioming", "张三", "李四"];
    print(testList); //[test1, xioming, 张三, xioming, 张三, 李四]

    testList.sort();
    print(testList);
    //将list中数据 重新随机排列
    testList.shuffle();
    print(testList); //[test1, xioming, xioming, 李四, 张三, 张三]

  });

  test(" sort ", () {
    List<String> testList = ["A", "D",  "F", "F","B", "C",];
    print(testList); //[A, D, F, F, B, C]

    ///升序排列
    testList.sort();
    print(testList);//[A, B, C, D, F, F]

    ///自定义排序规则
    testList.sort((value1,value2){
      if(value1.hashCode>value2.hashCode){
        return 1;
      }else{
        return -1;
      }
    });
    print(testList);

  });

  test(" sublist ", () {
    List<String> testList = ["A", "D",  "F", "F","B", "C",];
    print(testList); //[A, D, F, F, B, C]

    ///截取 [0,3) 范围中的元素
    List<String> sublist = testList.sublist(0,3);
    ///截取 [0,3) 范围中的元素
    Iterable<String> sublist2 = testList.getRange(0,3);

    print(sublist);///[A, D, F]
    ///
     print(sublist2);///(A, D, F)

  });

  test(" join ", () {
    List<String> testList = ["A", "D",  "F", "F","B", "C",];
    print(testList); //[A, D, F, F, B, C]

    ///用指定的字符将List中每个元素都连接起来，返回一个字符串
    /// 如这里将 List 中的数据 使用 , 号来连接
    String value = testList.join(",");

    print(value);///A,D,F,F,B,C

  });
}
