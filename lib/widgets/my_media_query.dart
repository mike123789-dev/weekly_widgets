import 'package:flutter/material.dart';

class MyMediaQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "width: ${screenSize.width}\nheight: ${screenSize.height}\naspect ratio: ${screenSize.aspectRatio}",
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 500,
          width: 500 * screenSize.aspectRatio,
          color: Colors.blueGrey[100],
        )
      ],
    );
  }
}
