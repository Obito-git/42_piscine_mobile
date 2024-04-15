import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen(
      {required this.expression, required this.result, super.key});
  final String expression;
  final String result;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 30);
    return Container(
        color: Colors.grey,
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(
            expression,
            style: textStyle,
          ),
          Text(result, style: textStyle)
        ]));
  }
}
