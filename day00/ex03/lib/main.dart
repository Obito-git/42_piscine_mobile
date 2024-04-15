import 'package:calculator_proj/screen.dart';
import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';
import 'calculator_button.dart';
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
  final Parser _p = Parser();
  final ContextModel _cm = ContextModel();
  final int _maxExpressionLen = 20;
  String _expression = "0";
  String _result = "0";

  String evaluateExpression(String inputExpression) {
    try {
      Expression exp = _p.parse(inputExpression);
      double eval = exp.evaluate(EvaluationType.REAL, _cm);
      return eval.toString();
    } catch (err) {
      print(err.toString());
      return "Calculation error";
    }
  }

  void _updateScreen(CalculatorButton pressedButton) {
    setState(() {
      final buttonValue = pressedButton.value;
      switch (pressedButton) {
        case CalculatorButton.clear:
          if (_expression.isNotEmpty) {
            _expression = _expression.substring(0, _expression.length - 1);
          }
          break;
        case CalculatorButton.allClear:
          _expression = "0";
          _result = "0";
          break;
        case CalculatorButton.equals:
          setState(() {
            _result = evaluateExpression(_expression);
          });
          break;
        default:
          if (_expression == "0") {
            _expression = buttonValue;
          } else if (_expression.length < _maxExpressionLen) {
            _expression += buttonValue;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text(_appName)),
      ),
      body: Column(
        children: [
          Expanded(
              child: CalculatorScreen(
            expression: _expression,
            result: _result,
          )),
          Keyboard(
            onKeyPress: _updateScreen,
            isPortrait: isPortrait,
          ),
        ],
      ),
    );
  }
}
