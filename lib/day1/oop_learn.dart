import 'dart:ffi';

/// 二. 面向对象（OOP）

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

class Student extends Person {
  /// 定义类的变量，以_下划线开头的变量名为私有变量（字段），只能在当前类内部使用
  late String _school;
  final String? city; // ? 表示该变量之后可能为null，late关键字表示延迟初始化，后面使用时必须传递值，不能传递null
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

  /// 重写toString方法
  @override
  String toString() {
    return 'name: $name, school: ${this._school}, city: $city, coutry: $country, 父类： ${super.toString()}';
  }

  /// 为私有变量设置getter来让外界获取到私有变量
  String get getSchool => _school;

  /// 为私有变量设置setter来控制外界对私有变量的修改
  set setSchool(String val) {
    _school = val;
  }

  /// 静态方法
  static doPrint(String str) {
    print('doPrint===$str');
  }
}

/// 工厂构造方法，一般用于网络请求后，将相应数据转换成模型结构的构造方法
class Logger {
  static late Logger _cache;

  /// 工厂构造方法不仅仅是构造方法，也是一种模式，有时候为了返回一个之前已经创建的缓存对象，
  /// 原始的构造方法已经不能满足要求，那么可以使用工厂模式来定义构造方法
  factory Logger() {
    _cache ??= Logger._internal();
    return _cache;
  }
  Logger._internal();
}

/// 抽象类，使用abstract修饰符来定义，该类不能被实例化。抽象类在定义接口时非常有用，是实际上抽象中也包含一些实现方法。
abstract class Study {
  // 抽象类可以包含没有方法体的方法
  void study();
}

/// 创建一个类来继承这个抽象类,并实现父类的抽象方法，如果此类不需要实现父类内部的抽象方法，那么也需要将此类定义成抽象类
class StudyFlutter extends Study {
  @override
  void study() {
    print('学习 Flutter');
  }
}

/// mixins 为类添加特征;
/// mixins的特征: 实现mixin, 就创建一个集成Object类的子类（不能继承其他类），不声明任何构造方法，不调用super
/// 在本文件以上所有类中，满足3个特征的类只有Study类，所有Study是mixins。
/// mixins 是在多个类层次结构中重用代码的一种方式
/// 使用方法：在with关键字后跟上一个或多个mixin的名字（用逗号分割），并且with要用在extends关键字关键之之后。
class Test extends Person with Study {
  Test(super.name, super.age); // 初始化类
  
  @override
  void study() {
    // TODO: implement study
  }
}