import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({required this.isPortrait, required this.buttons, super.key});

  final bool isPortrait;
  final List<String> buttons;

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
              onPressed: () => print(buttons[index]),
              child: Text(buttons[index]));
        });
  }
}
