import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  @override
  _MySliderState createState() => _MySliderState();
}

class SliderController {
  double sliderValue;
  SliderController(this.sliderValue);
}

class _MySliderState extends State<MySlider> {
  SliderController _firstSliderController = SliderController(0.0);
  SliderController _secondSliderController = SliderController(0.0);
  SliderController _thirdSliderController = SliderController(0.0);

  Widget buildSlider({
    SliderController controller,
    int divisions,
    String name,
    Color color = Colors.green,
    double enabledThumbRadius = 10.0,
    double elevation = 1.0,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(name),
          SizedBox(height: 10),
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: color,
              inactiveTrackColor: Colors.red,
              thumbColor: color,
              activeTickMarkColor: color,
              valueIndicatorColor: color,
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: enabledThumbRadius,
                elevation: elevation,
              ),
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            ),
            child: Slider(
              value: controller.sliderValue,
              min: 0.0,
              max: 100.0,
              divisions: divisions,
              label: '${controller.sliderValue.round()}',
              onChanged: (double newValue) {
                setState(
                  () {
                    controller.sliderValue = newValue;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSlider(
            controller: _firstSliderController,
            divisions: 10,
            name: "Green Slider With 10 Divisions",
          ),
          buildSlider(
            controller: _secondSliderController,
            divisions: 25,
            name: "Red Slider With 25 Divisions",
            color: Colors.red,
          ),
          buildSlider(
            controller: _thirdSliderController,
            divisions: null,
            name: "Black Slider With 0 Divisions (big)",
            color: Colors.black,
            enabledThumbRadius: 15.0,
          ),
        ],
      ),
    );
  }
}
