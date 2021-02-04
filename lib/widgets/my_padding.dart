import 'package:flutter/material.dart';

class MyPadding extends StatefulWidget {
  @override
  _MyPaddingState createState() => _MyPaddingState();
}

class _MyPaddingState extends State<MyPadding> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Hello World!'),
      ),
    );
  }
}
