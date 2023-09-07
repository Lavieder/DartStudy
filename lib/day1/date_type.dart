import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

// dart 常用数据类型
class DataType extends StatefulWidget {
  const DataType({super.key});

  @override
  State<DataType> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    // 2. 调用方法
    _numType();
    _stringType();
    _boolType();
    _listType();
    return const Placeholder();
  }

  // 1. 定义一个数字类型方法
  void _numType() {
    num num1 = -1.0; // num 类型是数字类型的父类，能接受int和double类型
    num num2 = 2;

    int int1 = -3; // int类型只能是整数
    double dou1 = 3.482; // double类型只能是浮点数

    print('num1: $num1, num2: $num2, int1: $int1, dou1: $dou1');

    //类型转换
    print(num1.abs()); // 求绝对值
    print(dou1.toInt()); //  double转int
    print(num2.toDouble()); //  double转int
  }

  // 定义一个字符串类型方法
  _stringType() {
    String str1 = '字符串1', str2 = "字符2ß串2"; // 使用String 定义字符串
    String str3 = '这是使用\$符号拼接：$str1, 字符串拼接$str2'; // 字符串使用$方式或+号拼接
    String str4 = '这是使用+号拼接: ' + str1 + ', 字符串拼接' + str2;
    print(str3);
    print(str4);

    // 字符串常用方法
    print('字符串截取：' + str1.substring(1, 3)); // 字符串截取
    print('字符串位置获取：${str3.indexOf('号')}'); // 字符串位置获取
    print('字符串是否以w开头：${str1.startsWith('w')}'); // 字符串以什么开头，返回true/false
    print('字符串内容替换：${str2.replaceAll('2', 'two')}'); // 字符串内容替换
    print('字符串是否包含+号：${str4.contains('+')}'); // 字符串是否包含指定字符，返回true/false
    print('字符串以2分割为数组：${str2.split('2')}'); // 分割字符串
  }

  // 布尔类型,Dart里是强bool类型检查，只有值为true/false才会被认为是bool
  _boolType() {
    bool suc = true, fail = false;
    print('suc: $suc, fail: $fail');
    print('fail || suc: ${fail || suc}');
    print('suc && fail: ${suc && fail}');
  }

  // List 集合类型
  _listType() {
    List list = [1, 2, true, '集合'];
    List<int> li2 = [1, 2, 3]; // <int>表示范型，意思是list内只能是int类型的值
    print('li2: $li2');
    // list = li2; // 错误语法，类型转换错误
    print('list: $list');
    List li3 = [];
    // 添加值
    li3.add('one');
    li3.addAll(list);
    print('li3: $li3');
    List li4 = List.generate(4, (index) => index * 4);
    print('li4: $li4');

    // 集合遍历
    for (int i = 0; i < list.length; i++) {
      print('i: $i -- ${list[i]}');
    }
    for (var item in list) {
      print('item: $item');
    }
    list.forEach((val) {
      print('val: $val');
    });

    // 作业： remove, insert, sublist, indexOf
  }
}
