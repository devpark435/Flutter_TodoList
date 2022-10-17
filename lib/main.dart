import 'package:flutter/material.dart';
import 'screens/todoListMain.dart';

void main() {
  runApp(const MyApp());
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
      home: const todoListMain(),
    );
  }
}
