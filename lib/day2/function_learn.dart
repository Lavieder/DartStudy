///  函数/方法学习
class FunctionLearn {
  // 方法的构成：返回值类型 + 方法名 + 参数
  /// 其中：方法返回值类型可以省略，也可以为void或具体的类型，
  /// 方法名：如果是匿名方法则不需要方法名，
  /// 参数：参数分为可选参数和参数默认值；参数类型可省略。
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

class TestFunction {
  // 调用方法
  FunctionLearn fl = FunctionLearn();
  void start() {
    print(fl.sum(100, 37));
    fl.anonmousFunction();
  }
}
