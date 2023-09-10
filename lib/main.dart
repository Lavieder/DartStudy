import 'package:dartstudy/day1/oop_learn.dart';
import 'package:dartstudy/day1/date_type.dart';
import 'package:dartstudy/day2/function_learn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Dart 基础语法学习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Dart基础语法学习'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // _oopLearn();
    _functionLearn();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: const <Widget>[
            // DataType(),
          ],
        ),
      ),
    );
  }

  void _oopLearn() {
    print('--------oopLearn--------');

    /// 静态方法调用
    Student.doPrint('这是doPrint');

    /// 创建Student对象/实例
    Student stu1 = Student('清华', '小张', 23);
    stu1.setSchool = '985';
    print('====>  ${stu1.toString()}');

    Student stu2 = Student('北大', 'Tome', 37, city: '上海', country: '中国');
    print('stu2====>  ${stu2.toString()}');

    StudyFlutter sf = StudyFlutter();
    sf.study();
  }

  void _functionLearn() {
    TestFunction tf = TestFunction();
    tf.start();
  }
}
