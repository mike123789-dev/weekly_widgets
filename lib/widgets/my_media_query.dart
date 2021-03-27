import 'package:flutter/material.dart';

class MyMediaQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenSize = data.size;
    final orientation = data.orientation;
    final padding = data.padding;
    final insets = data.viewInsets;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "width: ${screenSize.width}\nheight: ${screenSize.height}\naspect ratio: ${screenSize.aspectRatio}",
        ),
        Text(
          "orientation: ${orientation.toString()}\n",
        ),
        Text(
          "top padding: ${padding.top}\nbottom padding: ${padding.bottom}\n",
        ),
        Text(
          "top insets: ${insets.top}\nbottom insets: ${insets.bottom}\n",
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 300,
          width: 300 * screenSize.aspectRatio,
          color: Colors.blueGrey[100],
        )
      ],
    );
  }
}
