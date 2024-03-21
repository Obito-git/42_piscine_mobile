import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  final String _value1 = "A simple text";
  final String _value2 = "Hello world";
  String _displayText = "A simple text";

  void replaceText() {
    setState(() {
      _displayText = _displayText == _value1 ? _value2 : _value1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _displayText,
            style: const TextStyle(backgroundColor: Colors.green, fontSize: 26),
          ),
          const SizedBox(
            width: 30,
          ),
          TextButton(onPressed: replaceText, child: const Text("Click me"))
        ],
      ),
    ));
  }
}
