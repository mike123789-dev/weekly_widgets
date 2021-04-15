import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class MyColorPicker extends StatefulWidget {
  @override
  _MyColorPickerState createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  Color currentColor = Colors.red;

  void changeColor(Color color) => setState(() => currentColor = color);

  void pickColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext bc) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0.0),
          contentPadding: const EdgeInsets.all(0.0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ColorPicker(
                  pickerColor: currentColor,
                  onColorChanged: changeColor,
                  colorPickerWidth: 300.0,
                  pickerAreaHeightPercent: 0.7,
                  enableAlpha: true,
                  displayThumbColor: true,
                  showLabel: true,
                  paletteType: PaletteType.hsv,
                  pickerAreaBorderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(2.0),
                    topRight: const Radius.circular(2.0),
                  ),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("확인"),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(currentColor),
      ),
      onPressed: () {
        pickColor(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Change color"),
      ),
    );
  }
}
