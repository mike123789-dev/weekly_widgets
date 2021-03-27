import 'package:flutter/material.dart';

class DraggableComponent {
  final UniqueKey key;
  final String type;

  DraggableComponent({
    @required this.key,
    @required this.type,
  });
}

class MyDraggable extends StatefulWidget {
  @override
  _MyDraggableState createState() => _MyDraggableState();
}

class _MyDraggableState extends State<MyDraggable> {
  bool isDragging = false;
  List<Widget> draggableItems = [];

  deleteItem(Key key) {
    setState(() {
      draggableItems.removeWhere((element) => element.key == key);
    });
  }

  Widget addChild() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            draggableItems.add(
              DraggableStackItem(
                component: DraggableComponent(
                  key: UniqueKey(),
                  type: 'Container',
                ),
                isDragging: (dragging) {
                  setState(() {
                    this.isDragging = dragging;
                    print("changing!!!!");
                  });
                },
                key: UniqueKey(),
              ),
            );
          });
        },
        child: Text("Add widget"),
      ),
    );
  }

  Widget deleteChild() {
    return DragTarget<Key>(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        return Container(
          height: 100.0,
          width: 100.0,
          color: Colors.red,
          child: Center(
            child: Text('remove widget'),
          ),
        );
      },
      onAccept: (key) {
        deleteItem(key);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: draggableItems,
          ),
        ),
        isDragging ? deleteChild() : addChild(),
      ],
    );
  }
}

class DraggableStackItem extends StatefulWidget {
  final DraggableComponent component;
  final Function(bool) isDragging;

  const DraggableStackItem({
    Key key,
    @required this.component,
    this.isDragging,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DraggableStackItemState();
  }
}

class _DraggableStackItemState extends State<DraggableStackItem> {
  double xPosition = 0;
  double yPosition = 0;
  Color color;

  Widget childWidget() {
    return Container(
      width: 150,
      height: 150,
      color: color,
    );
  }

  void updatePosition(Offset delta) {
    setState(() {
      xPosition += delta.dx;
      yPosition += delta.dy;
    });
  }

  @override
  void initState() {
    final now = DateTime.now();
    final int i = now.microsecond;
    if (i % 3 == 0) {
      color = Colors.green;
    } else if (i % 3 == 1) {
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
      child: Draggable(
        data: widget.key,
        child: childWidget(),
        feedback: childWidget(),
        childWhenDragging: Container(), //empty container
        onDragStarted: () {
          widget.isDragging(true);
        },
        onDragEnd: (DraggableDetails details) {
          widget.isDragging(false);
        },
        onDragUpdate: (details) {
          updatePosition(details.delta);
        },
      ),
    );
  }
}
