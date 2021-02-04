import 'package:flutter/material.dart';

class ColumnWithSlider extends StatefulWidget {
  final Widget child;
  final double min;
  final double max;
  final double currentValue;
  final void Function(double) sliderChangeCallback;
  ColumnWithSlider({
    @required this.child,
    @required this.min,
    @required this.max,
    @required this.currentValue,
    @required this.sliderChangeCallback,
  });
  @override
  _ColumnWithSliderState createState() => _ColumnWithSliderState();
}

class _ColumnWithSliderState extends State<ColumnWithSlider> {
  double _currentValue;

  @override
  void initState() {
    _currentValue = widget.currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: widget.child,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Slider(
            value: _currentValue,
            min: widget.min,
            max: widget.max,
            divisions: (widget.max - widget.min).toInt(),
            label: "${_currentValue.round()}",
            onChanged: (double value) {
              setState(() {
                _currentValue = value;
              });
              widget.sliderChangeCallback(value);
            },
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
