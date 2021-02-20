import 'package:flutter/material.dart';

class MyStack extends StatelessWidget {
  Widget buildCard({Color color = Colors.white}) {
    return Card(
      elevation: 6,
      color: color,
      child: Container(
        width: 200,
        height: 300,
        child: Center(
          child: Text("A CARD"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned(
          top: -30,
          left: -30,
          child: buildCard(color: Colors.green[100]),
        ),
        Positioned(
          child: buildCard(color: Colors.red[100]),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: buildCard(color: Colors.blue[100]),
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
