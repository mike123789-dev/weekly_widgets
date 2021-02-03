import 'package:flutter/material.dart';
import 'package:weekly_widgets/my_widget.dart';

class DetailView extends StatelessWidget {
  final MyWidget myWidget;
  DetailView({this.myWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${myWidget.widgetName}"),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {})
        ],
      ),
      body: Center(child: myWidget.widget),
    );
  }
}
