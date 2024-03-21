import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({required this.expression, required this.result, super.key});
  final String expression;
  final String result;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 30);
    return Container(
        color: Colors.grey,
        width: double.infinity,
        alignment: const AlignmentDirectional(0.95, -1.0),
        child: Column(children: [
          Text(
            expression,
            style: textStyle,
          ),
          Text(result, style: textStyle)
        ]));
  }
}
