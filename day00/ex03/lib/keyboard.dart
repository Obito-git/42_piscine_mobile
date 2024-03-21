import 'package:flutter/material.dart';

import 'calculator_button.dart';

class Keyboard extends StatelessWidget {
  const Keyboard(
      {required this.onKeyPress,
      required this.isPortrait,
      super.key});

  final Function(CalculatorButton) onKeyPress;

  final bool isPortrait;

  final List<CalculatorButton> buttons = CalculatorButton.values;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, childAspectRatio: isPortrait ? 1 : 4),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return TextButton(
              onPressed: () => onKeyPress(buttons[index]),
              child: Text(buttons[index].value));
        });
  }
}
