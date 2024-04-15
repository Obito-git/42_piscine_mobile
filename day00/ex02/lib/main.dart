import 'package:ex02/screen.dart';
import 'package:flutter/material.dart';

import 'keyboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final String appName = "Calculator";
  String expression = "0";
  String result = "0";
  List<String> buttons = [
    "7",
    "8",
    "9",
    "C",
    "AC",
    "4",
    "5",
    "6",
    "+",
    "-",
    "1",
    "2",
    "3",
    "x",
    "/",
    "0",
    ".",
    "00",
    "="
  ];

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text(appName)),
      ),
      body: Column(
        children: [
          Expanded(
              child: Screen(
            expression: expression,
            result: result,
          )),
          Keyboard(
            isPortrait: isPortrait,
            buttons: buttons,
          ),
        ],
      ),
    );
  }
}
