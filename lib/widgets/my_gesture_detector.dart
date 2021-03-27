import 'package:flutter/material.dart';

class MyGestureDetector extends StatefulWidget {
  @override
  _MyGestureDetectorState createState() => _MyGestureDetectorState();
}

class _MyGestureDetectorState extends State<MyGestureDetector> {
  List<Widget> movableItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: movableItems,
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              movableItems.add(MoveableStackItem(
                i: movableItems.length + 1,
              ));
            });
          },
          child: Text("Add widget"),
        )
      ],
    );
  }
}

class MoveableStackItem extends StatefulWidget {
  final int i;

  const MoveableStackItem({Key key, @required this.i}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MoveableStackItemState();
  }
}

class _MoveableStackItemState extends State<MoveableStackItem> {
  double xPosition = 0;
  double yPosition = 0;
  Color color;

  @override
  void initState() {
    if (widget.i % 3 == 0) {
      color = Colors.green;
    } else if (widget.i % 3 == 1) {
      color = Colors.red;
    } else {
      color = Colors.blue;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: yPosition,
      left: xPosition,
      child: GestureDetector(
        onPanUpdate: (tapInfo) {
          setState(() {
            xPosition += tapInfo.delta.dx;
            yPosition += tapInfo.delta.dy;
          });
        },
        child: Container(
          width: 150,
          height: 150,
          child: Center(child: Text("${widget.i}")),
          color: color,
        ),
      ),
    );
  }
}
