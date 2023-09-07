# 学习笔记
# dart简介：
dart: 强类型语言，静态类型，面向对象语言
  编译方式：JIT: 即使编译，开发期间更快的编译，更快的重载
          AOP: 事前编译，release期间编译， 更快更流畅

# 一. 常用数据类型
## 数字类型
1. num: num类型是数字类型的父类
2. int：整形，只能定义整数数字（包含负整数）
3. double：浮点型，只能定义浮点数数字
### 类型转换（部分）
1. toInt(): 转换为整形
2. toDouble(): 转换为浮点型
3. toabs(): 求绝对值

## 字符串类型
String: String类型来定义字符串
### 字符串拼接
  字符串使用$符号或+号拼接
```
  String str1 = '字符串1', str2 = "字符2ß串2"; // 使用String 定义字符串
  String str3 = '这是使用\$符号拼接：$str1, 字符串拼接$str2'; 
  String str4 = '这是使用+号拼接: ' + str1 + ', 字符串拼接' + str2;
```
### 字符串方法（部分）
  substring(); indexOf(); startsWith();
  replaceAll(); contains(); split();
```
  print('字符串截取：' + str1.substring(1, 3)); 
  print('字符串位置获取：${str3.indexOf('号')}');
  print('字符串是否以w开头：${str1.startsWith('w')}'); 返回true/false
  print('字符串内容替换：${str2.replaceAll('2', 'two')}'); 
  print('字符串是否包含+号：${str4.contains('+')}'); 返回true/false
  print('字符串以2分割为数组：${str2.split('2')}'); 
```

## 布尔类型
注意：Dart里是强bool类型检查，只有值为true/false才会被认为是bool。

bool: bool类型用来定义布尔类型
```
  bool suc = true, fail = false;
  print('suc: $suc, fail: $fail');
  print('fail || suc: ${fail || suc}');
  print('suc && fail: ${suc && fail}');
```

## 集合类型
List: List类型用来定义集合/数组
```
  List list = [1, 2, true, '集合'];
  List<int> li2 = [1, 2, 3]; // <int>表示范型，意思是list内只能是int类型的值
  print('li2: $li2');
  // list = li2; // 错误语法，类型转换错误
```
### 集合内添加值
list.add('单个值');
list.addAll(['o', '2', false, 9]);

### 集合遍历(部分)
```
  for (int i = 0; i < list.length; i++) {
    print('i: $i -- ${list[i]}');
  }
  for (var item in list) {
    print('item: $item');
  }
  list.forEach((val) {
    print('val: $val');
  });
```