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

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "A simple text",
            style: TextStyle(backgroundColor: Colors.green, fontSize: 26),
          ),
          const SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () => print("Button pressed"),
              child: const Text("Click me"))
        ],
      ),
    ));
  }
}
