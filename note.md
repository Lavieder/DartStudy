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

## List集合类型
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

## Map类型
Map：Map类型类似于Object, 其结构为 {key: value}

### 使用（部分）
```
  // Map定义
  Map names = {'xm': '小明', 'xh': '小红'};

  // 添加元素
  names['zs'] = '张三';
  names['li'] = '里斯';

  // 删除元素
  names.remove('xh'); 
  
  // 取值
  names['li']; 

  // 遍历
  names.forEach((key, value) {
    print('key: $key, value: $value');
  });
  
  Map names2 = names.map((key, value) => MapEntry(key, value)); // 使用迭代生成一个新map

  var keys = names.keys; // 取key的所有值，返回一个key的集合

  var values = names.values; // 取value的值，返回一个value的集合
```

## dynamic, var, Object三者区别
1. dynamic: 是所有Dart对象的基础类型，它可以定义所有类型，属于动态数据类型，他的类型取决于值的类型，只有在运行的时候才知道是什么数据类型，所以相当于会关闭类型检查，之后能把其他的数据类型赋值给他，并不安全。不推荐使用。
```
  dynamic x = 'dyna';
  print('x: ${x.runtimeType}'); // String
  x = 123;
  print(x.runtimeType); // int
```

2. var: 是一个关键字，可以定义所有类型，但它的类型取决于第一次赋值的类型，之后不能改变，否则报错.
```
  var a = 'var';
  print('a: ${a.runtimeType}'); // String
  // a = 123; // 类型已定义为String，不能再更改为int，运行报错
```

3. Object：是Dart对象的基类，如果定义的类型是String，int等类型，则不能调用其内部的方法。
```
  Object b = 'qqqq';
  print('b: ${b.runtimeType}'); // String
  // b.foo();  // 运行报错
```


# 二. 面向对象OOP

## 基本概念
1. 封装，继承（extends），多态
```
  /// 定义一个Dart类，所有的类都继承至Object, 不写extends就默认继承Object
  class Person {
    /// 封装， extends 继承，
    String name;
    int age;
    Person(this.name, this.age);

    /// 初始化类方法

    /// 多态, 多表现与重载，重写父类方法
    @override
    String toString() {
      return 'name: $name, age: $age';
    }
  }
```

## 类
### 构造方法
1. 标准构造方法
```
  class Student extends Person {
    /// 定义类的变量，以_下划线开头的变量名为私有变量（字段），只能在当前类内部使用
    late String _school;
    final String? city; // ? 表示该变量可能为空，也可使用late定义
    String? country;
    late String name;
    /**
    * 跟在冒号:后的一段表达式叫为类的初始化列表,现在初始化父类的参数,也可以初始化实例变量;
    * 1. 构造方法： 通过this._school初始化私有参数，name, age交给父类进行初始化;
    *    带{ }的参数表示可选参数，country有默认值
    */ ///
    Student(this._school, String name, int age,
        {this.city, this.country = 'China'})

        /// 初始化实例变量，不同初始化变量之间用逗号（，）进行分割
        : name = '$country--$city',

          /// 如果父类没有默认的构造方法（无参的构造方法），则需要在初始化列表中调用父类的构造方法进行初始化
          super(name, age) {
      print('构造方法体不是必须的');
    }
```
2. 命名构造方法
```
    /// 2. 命名构造方法：类名+.+方法名
    /// 使用命名构造方法为类实现多个构造方法, 如果类的变量用final定义，则需要将其作为参数
    Student.cover(Student stu, this.city) : super(stu.name, stu.age) {
      print('命名构造方法');
    }

    /// 命名工厂构造方法，一般用于网络请求后，将相应数据转换成模型结构的构造方法
    /// 他可以有返回值，而且不需要将类的final变量作为参数，是提供一种灵活获取类对象的方式
    factory Student.stu(Student stu) {
      return Student(stu._school, stu.name, stu.age);
    }
  }
```
3. 工厂构造方法
```
  /// 工厂构造方法，一般用于网络请求后，将相应数据转换成模型结构的构造方法
  class Logger {
    static late Logger _cache;

    /// 工厂构造方法不仅仅是构造方法，也是一种模式，有时候为了返回一个之前已经创建的缓存对象，
    /// 原始的构造方法已经不能满足要求，南无可以使用工厂模式来定义构造方法
    factory Logger() {
      _cache ??= Logger._internal();
      return _cache;
    }
    Logger._internal();
  }
```
### 实例方法和静态方法
1. 实例方法
  除了静态方法外，其余都是实例方法。
2. 静态方法
```
  /// 静态方法
  static doPrint(String str) {
    print('doPrint===$str');
  }
```

### setter和getter
```
class Student extends Person {
  /// 为私有变量设置getter来让外界获取到私有变量
  String get getSchool => _school;

  /// 为私有变量设置setter来控制外界对私有变量的修改
  set setSchool(String val) {
    _school = val;
  }
}
```

## 抽象
### 抽象类
  抽象类: 使用abstract修饰符来定义，该类不能被实例化。  
  抽象类在定义接口时非常有用，在实际抽象类中也包含一些实现方法。
```
  abstract class Study {
    // 抽象类可以包含没有方法体的方法
    void study();
  }
```
### 抽象方法
  创建一个类来继承这个抽象类,并实现父类的抽象方法，如果此类不需要实现父类内部的抽象方法，那么也需要将此类定义成抽象类。
```
  class StudyFlutter extends Study {
    @override
    void study() {
      print('学习 Flutter');
    }
  }
```

## mixins
mixins 是在多个类层次结构中重用代码的一种方式；它需要满足三个特征：继承Object类的子类（不能继承其他类），不声明任何构造方法，不调用super。  
使用方法：使用with关键字并在后跟上一个或多个mixin的名字（用逗号分割），并且with要用在extends关键字关键之之后。
在以上类中，只有Study类满足三个特征，是mixins。
```
  class Test extends Person with Study {
    Test(super.name, super.age); // 初始化类
    
    @override
    void study() {
      // TODO: implement study
    }
  }
```

# 三.函数/方法
方法的构成：返回值类型 + 方法名 + 参数  
其中：方法返回值类型可以省略，也可以为void或具体的类型，  
方法名：如果是匿名方法则不需要方法名，  
参数：参数分为可选参数和参数默认值；参数类型可省略。
```
class FunctionLearn {
  /// 方法定义
  int sum(int val1, int val2) {
    return val1 + val2;
  }

  // 私有方法：以_开头命名，只能在该文件内使用
  _learn() {
    print('这是私有方法 _learn');
  }

  /// 匿名方法
  anonmousFunction() {
    var list = ['私有方法', '匿名方法'];
    list.forEach((i) {
      print(list.indexOf(i).toString() + ': ' + i);
    });
  }
}

// 创建一个类来调用方法
class TestFunction {
  FunctionLearn fl = FunctionLearn();
  void start() {
    print(fl.sum(100, 37));
    fl.anonmousFunction();
  }
}
```