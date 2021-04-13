import 'package:flutter/material.dart';

class MyInteractiveViewer extends StatefulWidget {
  @override
  _MyInteractiveViewerState createState() => _MyInteractiveViewerState();
}

class _MyInteractiveViewerState extends State<MyInteractiveViewer> {
  final transformationController = TransformationController();

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      boundaryMargin: EdgeInsets.all(double.infinity),
      transformationController: transformationController,
      minScale: 0.5,
      maxScale: 3,
      // You can off zooming by setting scaleEnable to false
      //scaleEnabled: false,
      onInteractionStart: (_) => print("Interaction Started"),
      onInteractionEnd: (details) {
        setState(() {
          transformationController.toScene(Offset.zero);
        });
      },
      onInteractionUpdate: (_) => print("Interaction Updated"),
      child: FlutterLogo(size: 300),
    );
  }
}
