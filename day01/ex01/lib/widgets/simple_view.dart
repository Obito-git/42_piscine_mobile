import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleView extends StatelessWidget {
  final String tabName;
  final String location;

  const SimpleView({super.key, required this.tabName, required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text(tabName), Text(location)],
    );
  }
}
