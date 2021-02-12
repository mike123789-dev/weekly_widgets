import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class MyContainerTransform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (_, openContainer) {
        return Container(
          height: 100,
          child: MaterialButton(
            elevation: 0.0,
            onPressed: openContainer,
            child: Text("hello"),
          ),
        );
      },
      openBuilder: (_, closeContainer) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: TextField(),
              leading: IconButton(
                onPressed: closeContainer,
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            body: Center(child: Text("DetailPage")));
      },
      closedElevation: 5.0,
      closedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      transitionDuration: Duration(seconds: 1),
      transitionType: ContainerTransitionType.fade,
    );
  }
}
