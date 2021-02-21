import 'package:flutter/material.dart';

class MyLayoutBuilder extends StatelessWidget {
  const MyLayoutBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final ratio = width / height;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "width: ${width}\nheight: ${height}\naspect ratio: ${ratio}",
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 500,
              width: 500 * ratio,
              color: Colors.blueGrey[100],
            )
          ],
        );
      },
    );
  }
}
