import 'package:flutter/material.dart';
import 'screens/todoListMain.dart';
import 'Screens/todoCalendar.dart';
import 'package:intl/date_symbol_data_local.dart';
const cols = 31;
const rows = 12;

List<List<String>> todoArray = List.generate(
    rows, (i) => List.generate(cols + 1, (j) => '', growable: false),
    growable: false);
void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
  List<String> todo(String a) {
    final List<String> a = <String>[];
    return a;
  }
}

//MARK: 실제 모든 스크린을 표현하는 위젯
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pricy',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          fontFamily: 'NotoSans'),
      home: const todoCalendar(),
    );
  }
}
