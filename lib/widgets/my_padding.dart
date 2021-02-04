import 'package:flutter/material.dart';
import 'package:weekly_widgets/widgets/reusable_widgets/column_with_slider.dart';

class MyPadding extends StatefulWidget {
  @override
  _MyPaddingState createState() => _MyPaddingState();
}

class _MyPaddingState extends State<MyPadding> {
  double paddingValue = 16.0;
  @override
  Widget build(BuildContext context) {
    return ColumnWithSlider(
      min: 0,
      max: 100,
      currentValue: paddingValue,
      sliderChangeCallback: (value) {
        setState(() {
          paddingValue = value;
        });
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(paddingValue),
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
