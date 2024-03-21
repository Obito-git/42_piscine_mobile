import 'package:ex03/screen.dart';
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
  final String _appName = "Calculator";
  String _expression = "0";
  String _result = "0";

  final List<String> _buttons = [
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

  void _updateScreen(String pressedButton) {
    setState(() {
      _expression += pressedButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: Text(_appName),
      ),
      body: Column(
        children: [
          Expanded(
              child: Screen(
            expression: _expression,
            result: _result,
          )),
          Keyboard(
            onKeyPress: _updateScreen,
            isPortrait: isPortrait,
            buttons: _buttons,
          ),
        ],
      ),
    );
  }
}
